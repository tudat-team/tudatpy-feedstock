print("THIS SCRIPT SHOULD BUILD THE DOCSTRINGS")
import sys
print(sys.path)

import subprocess
from document import *

# clone repository
docstring_path = get_docstrings('https://github.com/tudat-team/tudat-multidoc.git')

# parse api declaration
api_declaration = parse_api_declaration(docstring_path, py=True)

# generate docstring header
generate_docstring_header(api_declaration, "../../include/tudatpy/docstrings.h")