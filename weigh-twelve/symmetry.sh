#!/bin/bash

function swap {
   cat $1 | tr 'UD' 'DU' > $2
   echo "symmetric: $2"
}

swap a.node c.node
swap a1.node c3.node
swap a2.node c2.node
swap a3.node c1.node
swap b1.node b3.node
swap b1a.node b3c.node
swap b1b.node b3b.node
swap b1c.node b3a.node
swap a1a.node c3c.node
swap a1b.node c3b.node
swap a1c.node c3a.node
swap a2a.node c2c.node
swap a2b.node c2b.node
swap a2c.node c2a.node
swap a3a.node c1c.node
swap a3b.node c1b.node
swap a3c.node c1a.node
