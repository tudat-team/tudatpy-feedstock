print("THIS SCRIPT SHOULD BUILD THE DOCSTRINGS")

import importlib.util

print("Does document.py exist? It's size is:")
import os
print(os.path.getsize("$SRC_DIR/docs/source/document.py"))

spec=importlib.util.spec_from_file_location("document.","$SRC_DIR/docs/source/document.py")
document = importlib.util.module_from_spec(spec)

print("document import successful")

# clone repository
docstring_path = document.get_docstrings('https://github.com/tudat-team/tudat-multidoc.git')

# parse api declaration
api_declaration = document.parse_api_declaration(docstring_path, py=True)

# generate docstring header
document.generate_docstring_header(api_declaration, "$SRC_DIR/include/tudatpy/docstrings.h")

print("docstring header generated")