# custom functions:
function partar
{
    if [ $# -eq 2 ]
    then
        echo "executing:"
        echo " tar cvf - " ${1} " | pigz -p 4 > " ${2}
        tar cvf - ${1} | pigz -p 16 > ${2}
    else
        echo "Bad input!!!"
        echo "Please specify exatly two argument:"
        echo " 1st - pattern"
        echo " 2nd - archive name"
    fi
}

function inline(){
  echo $* | changeColonToNewLineCharacter
}

function changeColonToNewLineCharacter(){
  sed 's/\:/\n/g'
}

function changeColonToNewLineCharacter_mod(){
  sed 's/\:/\n   > /g'
}

function inline_mod(){
  echo "   > "$* | changeColonToNewLineCharacter_mod
}

function echo_env_var(){
  IFS=':' # delimiter
  read -ra ADDR <<< $*
  for i in "${ADDR[@]}"; do # access each element of array
      echo "$i"
  done
}
