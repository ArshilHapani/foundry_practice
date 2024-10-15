for d in ./*; do
    if [ -d "$d"]; then
        echo "Running tests in $d"
        cd $d
        forge fmt --check
        forge build --sizes
        forge test -vvv
        cd ..
    fi
done
