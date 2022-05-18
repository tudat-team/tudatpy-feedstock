print("THIS SCRIPT SHOULD BUILD THE DOCSTRINGS")

import sys

sys.path.insert(0, "$SRC_DIR/docs/source")
print(sys.path)

from document import *

print("document import successful")

# clone repository
docstring_path = get_docstrings('https://github.com/tudat-team/tudat-multidoc.git')

# parse api declaration
api_declaration = parse_api_declaration(docstring_path, py=True)

# generate docstring header
generate_docstring_header(api_declaration, "$SRC_DIR/include/tudatpy/docstrings.h")

print("docstring header generated")