REM Define target directory in Conda environment
set "TARGET_DIR=%CONDA_PREFIX%\share\external-repo"

REM Create directory if it doesn't exist
if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%"
cd /d "%TARGET_DIR%"

REM Clone repository using git
git clone https://github.com/NASA-PDS/PyTrk234.git .

REM Install the cloned repository with pip
pip install .