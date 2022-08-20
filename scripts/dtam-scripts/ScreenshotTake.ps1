<#
ScreenshotCopy.ps1

    Goal:
        The purpose of this script is to screenshot a screen and save a file of the screenshot to a specific location.
        This is agnostic and will take a picture by leveraging .NET capabilities, ignoring any screenshot functions within programs themselves.

    Audience:
        Automation-oriented screenshotters.

    Version:
        8/17 - Original version

    Return Codes:
        Success - 0
        Failure - 1

    References:
        Image saving logic - https://docs.microsoft.com/en-us/dotnet/api/system.drawing.image.save?view=dotnet-plat-ext-6.0
#>

# Global variables for various logging functions
$ScriptName = $MyInvocation.MyCommand
$LogFolderPath = "C:\Program Files\_ScriptLogs"
$LogFilePath = "$($LogFolderPath)\$($ScriptName).log"
$LogTailPath = "$($LogFolderPath)\$($ScriptName)_Transcript.log"

# Create our log directory if it doesn't exist
if (!(Test-Path -Path $LogFolderPath)) {
        New-Item -ItemType Directory -Force -Path $LogFolderPath
}

# Primary logging function
function Write-Log($Message) {
        Add-Content $LogFilePath "$(Get-Date) - $Message"
        Write-Output $Message
        $Global:EventMessage += $Message | Out-String
    }

# Overarching Try block for execution
try {
    # Begin a tail for logging non-implicitly captured events from the terminal
    Start-Transcript -Path $LogTailPath -Append

    # Prep variables for the file we'll create
    $FileName = Get-Date -Format yyyy-MM-dd_hh-mm
    $File = "C:\Users\me\Pictures\Uploads\$($FileName).jpg"

    # Add assembly references
    Add-Type -AssemblyName System.Windows.Forms
    Add-type -AssemblyName System.Drawing

    # Map out screen resolution and corners
    $Screen = [System.Windows.Forms.SystemInformation]::VirtualScreen
    $Width = $Screen.Width
    $Height = $Screen.Height
    $Left = $Screen.Left
    $Top = $Screen.Top

    # Create the bitmap using the top-left and bottom-right bounds
    $Bitmap = New-Object System.Drawing.Bitmap $Width, $Height

    # Create a graphics object for collection
    $GraphicObject = [System.Drawing.Graphics]::FromImage($Bitmap)

    # Capture the content on screen
    $GraphicObject.CopyFromScreen($Left, $Top, 0, 0, $Bitmap.Size)

    # Save to a .jpg file
    $Bitmap.Save($File)
    Write-Log "Screenshot saved to $($File)"
    Write-Log $File

    # Cleanup and exit script
    Write-Log "Script complete."
    Stop-Transcript
    Exit 0
}

# Overarching catch block for error handling
catch {
    # Cleanup and exit script
    Write-Log "Script failed with the following exception: $($_)"
    Stop-Transcript
    Exit 1
}
