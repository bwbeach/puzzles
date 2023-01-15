#!/bin/bash

symmetry.sh && gen-svg.sh && dot -Tpng tree.dot > tree.png && open tree.png
