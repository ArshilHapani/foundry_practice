for d in ./*; do
    if [ -d "$d" ]; then
        if [ ! -f "$d/foundry.toml" ]; then
            continue
        fi
        echo "Running tests in $d"
        cd $d
        forge fmt --check
        forge build --sizes
        forge test -vvv
        cd ..
    fi
done
