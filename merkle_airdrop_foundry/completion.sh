_forge() {
    local i cur prev opts cmd
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    cmd=""
    opts=""

    for i in ${COMP_WORDS[@]}
    do
        case "${cmd},${i}" in
            ",$1")
                cmd="forge"
                ;;
            forge,b)
                cmd="forge__build"
                ;;
            forge,bind)
                cmd="forge__bind"
                ;;
            forge,bind-json)
                cmd="forge__bind__json"
                ;;
            forge,build)
                cmd="forge__build"
                ;;
            forge,c)
                cmd="forge__create"
                ;;
            forge,cache)
                cmd="forge__cache"
                ;;
            forge,cl)
                cmd="forge__clean"
                ;;
            forge,clean)
                cmd="forge__clean"
                ;;
            forge,clone)
                cmd="forge__clone"
                ;;
            forge,co)
                cmd="forge__config"
                ;;
            forge,com)
                cmd="forge__completions"
                ;;
            forge,compile)
                cmd="forge__build"
                ;;
            forge,completions)
                cmd="forge__completions"
                ;;
            forge,config)
                cmd="forge__config"
                ;;
            forge,coverage)
                cmd="forge__coverage"
                ;;
            forge,create)
                cmd="forge__create"
                ;;
            forge,d)
                cmd="forge__debug"
                ;;
            forge,debug)
                cmd="forge__debug"
                ;;
            forge,doc)
                cmd="forge__doc"
                ;;
            forge,eip712)
                cmd="forge__eip712"
                ;;
            forge,f)
                cmd="forge__flatten"
                ;;
            forge,fig)
                cmd="forge__generate__fig__spec"
                ;;
            forge,flatten)
                cmd="forge__flatten"
                ;;
            forge,fmt)
                cmd="forge__fmt"
                ;;
            forge,geiger)
                cmd="forge__geiger"
                ;;
            forge,generate)
                cmd="forge__generate"
                ;;
            forge,generate-fig-spec)
                cmd="forge__generate__fig__spec"
                ;;
            forge,help)
                cmd="forge__help"
                ;;
            forge,i)
                cmd="forge__install"
                ;;
            forge,in)
                cmd="forge__inspect"
                ;;
            forge,init)
                cmd="forge__init"
                ;;
            forge,inspect)
                cmd="forge__inspect"
                ;;
            forge,install)
                cmd="forge__install"
                ;;
            forge,re)
                cmd="forge__remappings"
                ;;
            forge,remappings)
                cmd="forge__remappings"
                ;;
            forge,remove)
                cmd="forge__remove"
                ;;
            forge,rm)
                cmd="forge__remove"
                ;;
            forge,s)
                cmd="forge__snapshot"
                ;;
            forge,script)
                cmd="forge__script"
                ;;
            forge,se)
                cmd="forge__selectors"
                ;;
            forge,selectors)
                cmd="forge__selectors"
                ;;
            forge,snapshot)
                cmd="forge__snapshot"
                ;;
            forge,soldeer)
                cmd="forge__soldeer"
                ;;
            forge,t)
                cmd="forge__test"
                ;;
            forge,test)
                cmd="forge__test"
                ;;
            forge,tr)
                cmd="forge__tree"
                ;;
            forge,tree)
                cmd="forge__tree"
                ;;
            forge,u)
                cmd="forge__update"
                ;;
            forge,update)
                cmd="forge__update"
                ;;
            forge,v)
                cmd="forge__verify__contract"
                ;;
            forge,vb)
                cmd="forge__verify__bytecode"
                ;;
            forge,vc)
                cmd="forge__verify__check"
                ;;
            forge,verify-bytecode)
                cmd="forge__verify__bytecode"
                ;;
            forge,verify-check)
                cmd="forge__verify__check"
                ;;
            forge,verify-contract)
                cmd="forge__verify__contract"
                ;;
            forge__cache,clean)
                cmd="forge__cache__clean"
                ;;
            forge__cache,help)
                cmd="forge__cache__help"
                ;;
            forge__cache,ls)
                cmd="forge__cache__ls"
                ;;
            forge__cache__help,clean)
                cmd="forge__cache__help__clean"
                ;;
            forge__cache__help,help)
                cmd="forge__cache__help__help"
                ;;
            forge__cache__help,ls)
                cmd="forge__cache__help__ls"
                ;;
            forge__generate,help)
                cmd="forge__generate__help"
                ;;
            forge__generate,test)
                cmd="forge__generate__test"
                ;;
            forge__generate__help,help)
                cmd="forge__generate__help__help"
                ;;
            forge__generate__help,test)
                cmd="forge__generate__help__test"
                ;;
            forge__help,bind)
                cmd="forge__help__bind"
                ;;
            forge__help,bind-json)
                cmd="forge__help__bind__json"
                ;;
            forge__help,build)
                cmd="forge__help__build"
                ;;
            forge__help,cache)
                cmd="forge__help__cache"
                ;;
            forge__help,clean)
                cmd="forge__help__clean"
                ;;
            forge__help,clone)
                cmd="forge__help__clone"
                ;;
            forge__help,completions)
                cmd="forge__help__completions"
                ;;
            forge__help,config)
                cmd="forge__help__config"
                ;;
            forge__help,coverage)
                cmd="forge__help__coverage"
                ;;
            forge__help,create)
                cmd="forge__help__create"
                ;;
            forge__help,debug)
                cmd="forge__help__debug"
                ;;
            forge__help,doc)
                cmd="forge__help__doc"
                ;;
            forge__help,eip712)
                cmd="forge__help__eip712"
                ;;
            forge__help,flatten)
                cmd="forge__help__flatten"
                ;;
            forge__help,fmt)
                cmd="forge__help__fmt"
                ;;
            forge__help,geiger)
                cmd="forge__help__geiger"
                ;;
            forge__help,generate)
                cmd="forge__help__generate"
                ;;
            forge__help,generate-fig-spec)
                cmd="forge__help__generate__fig__spec"
                ;;
            forge__help,help)
                cmd="forge__help__help"
                ;;
            forge__help,init)
                cmd="forge__help__init"
                ;;
            forge__help,inspect)
                cmd="forge__help__inspect"
                ;;
            forge__help,install)
                cmd="forge__help__install"
                ;;
            forge__help,remappings)
                cmd="forge__help__remappings"
                ;;
            forge__help,remove)
                cmd="forge__help__remove"
                ;;
            forge__help,script)
                cmd="forge__help__script"
                ;;
            forge__help,selectors)
                cmd="forge__help__selectors"
                ;;
            forge__help,snapshot)
                cmd="forge__help__snapshot"
                ;;
            forge__help,soldeer)
                cmd="forge__help__soldeer"
                ;;
            forge__help,test)
                cmd="forge__help__test"
                ;;
            forge__help,tree)
                cmd="forge__help__tree"
                ;;
            forge__help,update)
                cmd="forge__help__update"
                ;;
            forge__help,verify-bytecode)
                cmd="forge__help__verify__bytecode"
                ;;
            forge__help,verify-check)
                cmd="forge__help__verify__check"
                ;;
            forge__help,verify-contract)
                cmd="forge__help__verify__contract"
                ;;
            forge__help__cache,clean)
                cmd="forge__help__cache__clean"
                ;;
            forge__help__cache,ls)
                cmd="forge__help__cache__ls"
                ;;
            forge__help__generate,test)
                cmd="forge__help__generate__test"
                ;;
            forge__help__selectors,collision)
                cmd="forge__help__selectors__collision"
                ;;
            forge__help__selectors,find)
                cmd="forge__help__selectors__find"
                ;;
            forge__help__selectors,list)
                cmd="forge__help__selectors__list"
                ;;
            forge__help__selectors,upload)
                cmd="forge__help__selectors__upload"
                ;;
            forge__help__soldeer,init)
                cmd="forge__help__soldeer__init"
                ;;
            forge__help__soldeer,install)
                cmd="forge__help__soldeer__install"
                ;;
            forge__help__soldeer,login)
                cmd="forge__help__soldeer__login"
                ;;
            forge__help__soldeer,push)
                cmd="forge__help__soldeer__push"
                ;;
            forge__help__soldeer,uninstall)
                cmd="forge__help__soldeer__uninstall"
                ;;
            forge__help__soldeer,update)
                cmd="forge__help__soldeer__update"
                ;;
            forge__help__soldeer,version)
                cmd="forge__help__soldeer__version"
                ;;
            forge__selectors,co)
                cmd="forge__selectors__collision"
                ;;
            forge__selectors,collision)
                cmd="forge__selectors__collision"
                ;;
            forge__selectors,f)
                cmd="forge__selectors__find"
                ;;
            forge__selectors,find)
                cmd="forge__selectors__find"
                ;;
            forge__selectors,help)
                cmd="forge__selectors__help"
                ;;
            forge__selectors,list)
                cmd="forge__selectors__list"
                ;;
            forge__selectors,ls)
                cmd="forge__selectors__list"
                ;;
            forge__selectors,up)
                cmd="forge__selectors__upload"
                ;;
            forge__selectors,upload)
                cmd="forge__selectors__upload"
                ;;
            forge__selectors__help,collision)
                cmd="forge__selectors__help__collision"
                ;;
            forge__selectors__help,find)
                cmd="forge__selectors__help__find"
                ;;
            forge__selectors__help,help)
                cmd="forge__selectors__help__help"
                ;;
            forge__selectors__help,list)
                cmd="forge__selectors__help__list"
                ;;
            forge__selectors__help,upload)
                cmd="forge__selectors__help__upload"
                ;;
            forge__soldeer,help)
                cmd="forge__soldeer__help"
                ;;
            forge__soldeer,init)
                cmd="forge__soldeer__init"
                ;;
            forge__soldeer,install)
                cmd="forge__soldeer__install"
                ;;
            forge__soldeer,login)
                cmd="forge__soldeer__login"
                ;;
            forge__soldeer,push)
                cmd="forge__soldeer__push"
                ;;
            forge__soldeer,uninstall)
                cmd="forge__soldeer__uninstall"
                ;;
            forge__soldeer,update)
                cmd="forge__soldeer__update"
                ;;
            forge__soldeer,version)
                cmd="forge__soldeer__version"
                ;;
            forge__soldeer__help,help)
                cmd="forge__soldeer__help__help"
                ;;
            forge__soldeer__help,init)
                cmd="forge__soldeer__help__init"
                ;;
            forge__soldeer__help,install)
                cmd="forge__soldeer__help__install"
                ;;
            forge__soldeer__help,login)
                cmd="forge__soldeer__help__login"
                ;;
            forge__soldeer__help,push)
                cmd="forge__soldeer__help__push"
                ;;
            forge__soldeer__help,uninstall)
                cmd="forge__soldeer__help__uninstall"
                ;;
            forge__soldeer__help,update)
                cmd="forge__soldeer__help__update"
                ;;
            forge__soldeer__help,version)
                cmd="forge__soldeer__help__version"
                ;;
            *)
                ;;
        esac
    done

    case "${cmd}" in
        forge)
            opts="-h -V --help --version test t script coverage bind build b compile clone debug d update u install i remove rm remappings re verify-contract v verify-check vc verify-bytecode vb create c init completions com generate-fig-spec fig clean cl cache snapshot s config co flatten f fmt inspect in tree tr geiger doc selectors se generate soldeer eip712 bind-json help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__bind)
            opts="-b -o -C -R -h --bindings-path --select --select-all --crate-name --crate-version --module --overwrite --single-file --skip-cargo-toml --skip-build --skip-extra-derives --alloy --alloy-version --ethers --force --no-cache --libraries --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --no-metadata --out --revert-strings --silent --build-info --build-info-path --eof --skip --ast --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --bindings-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -b)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --select)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --crate-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --crate-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --alloy-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -o)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --skip)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__bind__json)
            opts="-o -C -R -h --force --no-cache --libraries --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --no-metadata --out --revert-strings --silent --build-info --build-info-path --eof --skip --ast --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --help [PATH]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -o)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --skip)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__build)
            opts="-o -C -R -w -h --names --sizes --force --no-cache --libraries --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --no-metadata --out --revert-strings --silent --build-info --build-info-path --eof --skip --ast --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --watch --no-restart --run-all --watch-delay --format-json --help [PATHS]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -o)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --skip)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --watch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -w)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --watch-delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__build)
            opts="-o -C -R -w -h --names --sizes --force --no-cache --libraries --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --no-metadata --out --revert-strings --silent --build-info --build-info-path --eof --skip --ast --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --watch --no-restart --run-all --watch-delay --format-json --help [PATHS]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -o)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --skip)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --watch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -w)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --watch-delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__build)
            opts="-o -C -R -w -h --names --sizes --force --no-cache --libraries --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --no-metadata --out --revert-strings --silent --build-info --build-info-path --eof --skip --ast --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --watch --no-restart --run-all --watch-delay --format-json --help [PATHS]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -o)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --skip)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --watch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -w)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --watch-delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__cache)
            opts="-h --help clean ls help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__cache__clean)
            opts="-b -h --blocks --etherscan --help [CHAINS]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --blocks)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -b)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__cache__help)
            opts="clean ls help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__cache__help__clean)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__cache__help__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__cache__help__ls)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__cache__ls)
            opts="-h --help [CHAINS]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__clean)
            opts="-h --root --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__clean)
            opts="-h --root --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__clone)
            opts="-e -c -q -h --no-remappings-txt --keep-directory-structure --etherscan-api-key --chain --shallow --no-git --no-commit --quiet --help <ADDRESS> [PATH]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --etherscan-api-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -e)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__completions)
            opts="-h --help bash elvish fish powershell zsh"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__completions)
            opts="-h --help bash elvish fish powershell zsh"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__config)
            opts="-o -C -R -w -f -v -h --basic --json --fix --names --sizes --force --no-cache --libraries --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --no-metadata --out --revert-strings --silent --build-info --build-info-path --eof --skip --ast --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --watch --no-restart --run-all --watch-delay --format-json --rpc-url --fork-url --fork-block-number --fork-retries --fork-retry-backoff --no-storage-caching --initial-balance --sender --ffi --always-use-create-2-factory --verbosity --compute-units-per-second --no-rate-limit --no-rpc-rate-limit --gas-limit --code-size-limit --chain-id --chain --gas-price --base-fee --block-base-fee-per-gas --tx-origin --block-coinbase --block-timestamp --block-number --block-difficulty --block-prevrandao --block-gas-limit --memory-limit --no-gas-limit --disable-block-gas-limit --isolate --alphanet --help [PATHS]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -o)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --skip)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --watch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -w)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --watch-delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rpc-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-retries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-retry-backoff)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --initial-balance)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --sender)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --compute-units-per-second)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --code-size-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain-id)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-base-fee-per-gas)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --base-fee)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --tx-origin)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-coinbase)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-timestamp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-difficulty)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-prevrandao)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --memory-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__config)
            opts="-o -C -R -w -f -v -h --basic --json --fix --names --sizes --force --no-cache --libraries --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --no-metadata --out --revert-strings --silent --build-info --build-info-path --eof --skip --ast --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --watch --no-restart --run-all --watch-delay --format-json --rpc-url --fork-url --fork-block-number --fork-retries --fork-retry-backoff --no-storage-caching --initial-balance --sender --ffi --always-use-create-2-factory --verbosity --compute-units-per-second --no-rate-limit --no-rpc-rate-limit --gas-limit --code-size-limit --chain-id --chain --gas-price --base-fee --block-base-fee-per-gas --tx-origin --block-coinbase --block-timestamp --block-number --block-difficulty --block-prevrandao --block-gas-limit --memory-limit --no-gas-limit --disable-block-gas-limit --isolate --alphanet --help [PATHS]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -o)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --skip)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --watch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -w)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --watch-delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rpc-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-retries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-retry-backoff)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --initial-balance)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --sender)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --compute-units-per-second)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --code-size-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain-id)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-base-fee-per-gas)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --base-fee)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --tx-origin)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-coinbase)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-timestamp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-difficulty)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-prevrandao)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --memory-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__coverage)
            opts="-r -l -j -f -v -o -C -R -w -h --report --ir-minimum --report-file --include-libs --debug --flamegraph --flamechart --decode-internal --gas-report --allow-failure --json --junit --fail-fast --etherscan-api-key --list --fuzz-seed --fuzz-runs --fuzz-input-file --jobs --threads --show-progress --mt --match-test --nmt --no-match-test --mc --match-contract --nmc --no-match-contract --mp --match-path --nmp --no-match-path --nmco --no-match-coverage --rerun --rpc-url --fork-url --fork-block-number --fork-retries --fork-retry-backoff --no-storage-caching --initial-balance --sender --ffi --always-use-create-2-factory --verbosity --compute-units-per-second --no-rate-limit --no-rpc-rate-limit --gas-limit --code-size-limit --chain-id --chain --gas-price --base-fee --block-base-fee-per-gas --tx-origin --block-coinbase --block-timestamp --block-number --block-difficulty --block-prevrandao --block-gas-limit --memory-limit --no-gas-limit --disable-block-gas-limit --isolate --alphanet --force --no-cache --libraries --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --no-metadata --out --revert-strings --silent --build-info --build-info-path --eof --skip --ast --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --watch --no-restart --run-all --watch-delay --summary --detailed --help [PATH]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --report)
                    COMPREPLY=($(compgen -W "summary lcov debug bytecode" -- "${cur}"))
                    return 0
                    ;;
                --report-file)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                -r)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --debug)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --decode-internal)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --etherscan-api-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fuzz-seed)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fuzz-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fuzz-input-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --threads)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --jobs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -j)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --match-test)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mt)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-test)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmt)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --match-contract)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mc)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-contract)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmc)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --match-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-coverage)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmco)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rpc-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-retries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-retry-backoff)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --initial-balance)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --sender)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --compute-units-per-second)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --code-size-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain-id)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-base-fee-per-gas)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --base-fee)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --tx-origin)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-coinbase)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-timestamp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-difficulty)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-prevrandao)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --memory-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -o)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --skip)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --watch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -w)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --watch-delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__create)
            opts="-o -C -R -r -e -c -f -i -l -t -h --constructor-args --constructor-args-path --json --verify --unlocked --show-standard-json-input --timeout --force --no-cache --libraries --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --no-metadata --out --revert-strings --silent --build-info --build-info-path --eof --skip --ast --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --gas-limit --gas-price --priority-gas-price --value --nonce --legacy --blob --blob-gas-price --auth --access-list --rpc-url --flashbots --jwt-secret --etherscan-api-key --chain --from --interactive --private-key --mnemonic --mnemonic-passphrase --mnemonic-derivation-path --mnemonic-index --keystore --account --password --password-file --ledger --trezor --aws --gcp --verifier --verifier-url --retries --delay --help <CONTRACT>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --constructor-args)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --constructor-args-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --timeout)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -o)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --skip)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --priority-gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --value)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nonce)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --blob-gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --auth)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --access-list)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rpc-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --jwt-secret)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --etherscan-api-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -e)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --from)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --private-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mnemonic)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mnemonic-passphrase)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mnemonic-derivation-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mnemonic-index)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keystore)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --account)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --password)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --password-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verifier)
                    COMPREPLY=($(compgen -W "etherscan sourcify blockscout oklink" -- "${cur}"))
                    return 0
                    ;;
                --verifier-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --retries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__create)
            opts="-o -C -R -r -e -c -f -i -l -t -h --constructor-args --constructor-args-path --json --verify --unlocked --show-standard-json-input --timeout --force --no-cache --libraries --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --no-metadata --out --revert-strings --silent --build-info --build-info-path --eof --skip --ast --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --gas-limit --gas-price --priority-gas-price --value --nonce --legacy --blob --blob-gas-price --auth --access-list --rpc-url --flashbots --jwt-secret --etherscan-api-key --chain --from --interactive --private-key --mnemonic --mnemonic-passphrase --mnemonic-derivation-path --mnemonic-index --keystore --account --password --password-file --ledger --trezor --aws --gcp --verifier --verifier-url --retries --delay --help <CONTRACT>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --constructor-args)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --constructor-args-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --timeout)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -o)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --skip)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --priority-gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --value)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nonce)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --blob-gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --auth)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --access-list)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rpc-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --jwt-secret)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --etherscan-api-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -e)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --from)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --private-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mnemonic)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mnemonic-passphrase)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mnemonic-derivation-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mnemonic-index)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keystore)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --account)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --password)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --password-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verifier)
                    COMPREPLY=($(compgen -W "etherscan sourcify blockscout oklink" -- "${cur}"))
                    return 0
                    ;;
                --verifier-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --retries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__debug)
            opts="-s -o -C -R -f -v -h --tc --target-contract --sig --debug --force --no-cache --libraries --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --no-metadata --out --revert-strings --silent --build-info --build-info-path --eof --skip --ast --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --rpc-url --fork-url --fork-block-number --fork-retries --fork-retry-backoff --no-storage-caching --initial-balance --sender --ffi --always-use-create-2-factory --verbosity --compute-units-per-second --no-rate-limit --no-rpc-rate-limit --gas-limit --code-size-limit --chain-id --chain --gas-price --base-fee --block-base-fee-per-gas --tx-origin --block-coinbase --block-timestamp --block-number --block-difficulty --block-prevrandao --block-gas-limit --memory-limit --no-gas-limit --disable-block-gas-limit --isolate --alphanet --help <PATH> [ARGS]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --target-contract)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --tc)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --sig)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -s)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -o)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --skip)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --fork-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rpc-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-retries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-retry-backoff)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --initial-balance)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --sender)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --compute-units-per-second)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --code-size-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain-id)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-base-fee-per-gas)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --base-fee)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --tx-origin)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-coinbase)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-timestamp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-difficulty)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-prevrandao)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --memory-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__debug)
            opts="-s -o -C -R -f -v -h --tc --target-contract --sig --debug --force --no-cache --libraries --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --no-metadata --out --revert-strings --silent --build-info --build-info-path --eof --skip --ast --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --rpc-url --fork-url --fork-block-number --fork-retries --fork-retry-backoff --no-storage-caching --initial-balance --sender --ffi --always-use-create-2-factory --verbosity --compute-units-per-second --no-rate-limit --no-rpc-rate-limit --gas-limit --code-size-limit --chain-id --chain --gas-price --base-fee --block-base-fee-per-gas --tx-origin --block-coinbase --block-timestamp --block-number --block-difficulty --block-prevrandao --block-gas-limit --memory-limit --no-gas-limit --disable-block-gas-limit --isolate --alphanet --help <PATH> [ARGS]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --target-contract)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --tc)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --sig)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -s)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -o)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --skip)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --fork-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rpc-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-retries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-retry-backoff)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --initial-balance)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --sender)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --compute-units-per-second)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --code-size-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain-id)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-base-fee-per-gas)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --base-fee)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --tx-origin)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-coinbase)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-timestamp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-difficulty)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-prevrandao)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --memory-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__doc)
            opts="-o -b -s -w -p -i -h --root --out --build --serve --open --hostname --watch --no-restart --run-all --watch-delay --port --deployments --include-libraries --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --out)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -o)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --hostname)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --watch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -w)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --watch-delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --port)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -p)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --deployments)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__eip712)
            opts="-o -C -R -h --force --no-cache --libraries --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --no-metadata --out --revert-strings --silent --build-info --build-info-path --eof --skip --ast --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --help <PATH>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -o)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --skip)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__flatten)
            opts="-o -C -R -h --output --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --help <PATH>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                -o)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__flatten)
            opts="-o -C -R -h --output --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --help <PATH>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                -o)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__fmt)
            opts="-r -h --root --check --raw --help [PATH]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__geiger)
            opts="-h --root --check --ignore --full --help [PATH]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --ignore)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__generate)
            opts="-h --help test help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__generate__fig__spec)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__generate__fig__spec)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__generate__help)
            opts="test help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__generate__help__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__generate__help__test)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__generate__test)
            opts="-c -h --contract-name --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --contract-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help)
            opts="test script coverage bind build clone debug update install remove remappings verify-contract verify-check verify-bytecode create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect tree geiger doc selectors generate soldeer eip712 bind-json help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__bind)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__bind__json)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__build)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__cache)
            opts="clean ls"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__cache__clean)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__cache__ls)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__clean)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__clone)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__completions)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__config)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__coverage)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__debug)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__doc)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__eip712)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__flatten)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__fmt)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__geiger)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__generate)
            opts="test"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__generate__fig__spec)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__generate__test)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__init)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__inspect)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__install)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__remappings)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__remove)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__script)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__selectors)
            opts="collision upload list find"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__selectors__collision)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__selectors__find)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__selectors__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__selectors__upload)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__snapshot)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__soldeer)
            opts="init install update login push uninstall version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__soldeer__init)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__soldeer__install)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__soldeer__login)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__soldeer__push)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__soldeer__uninstall)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__soldeer__update)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__soldeer__version)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__test)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__tree)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__update)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__verify__bytecode)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__verify__check)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__verify__contract)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__init)
            opts="-t -b -q -h --template --branch --no-deps --offline --force --vscode --shallow --no-git --no-commit --quiet --help [PATH]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --template)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --branch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -b)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__inspect)
            opts="-o -C -R -h --pretty --force --no-cache --libraries --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --no-metadata --out --revert-strings --silent --build-info --build-info-path --eof --skip --ast --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --help <CONTRACT> abi bytecode deployedBytecode assembly legacyAssembly assemblyOptimized methodIdentifiers gasEstimates storageLayout devdoc ir irOptimized metadata userdoc ewasm errors events eof eof-init"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -o)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --skip)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__inspect)
            opts="-o -C -R -h --pretty --force --no-cache --libraries --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --no-metadata --out --revert-strings --silent --build-info --build-info-path --eof --skip --ast --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --help <CONTRACT> abi bytecode deployedBytecode assembly legacyAssembly assemblyOptimized methodIdentifiers gasEstimates storageLayout devdoc ir irOptimized metadata userdoc ewasm errors events eof eof-init"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -o)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --skip)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__install)
            opts="-q -h --root --shallow --no-git --no-commit --quiet --help [DEPENDENCIES]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__install)
            opts="-q -h --root --shallow --no-git --no-commit --quiet --help [DEPENDENCIES]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__remappings)
            opts="-h --root --pretty --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__remappings)
            opts="-h --root --pretty --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__remove)
            opts="-f -h --root --force --help <DEPENDENCIES>..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__remove)
            opts="-f -h --root --force --help <DEPENDENCIES>..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__script)
            opts="-s -g -o -C -R -a -i -l -t -f -v -h --tc --target-contract --sig --priority-gas-price --legacy --broadcast --batch-size --skip-simulation --gas-estimate-multiplier --unlocked --resume --multi --debug --slow --non-interactive --etherscan-api-key --verify --json --with-gas-price --timeout --force --no-cache --libraries --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --no-metadata --out --revert-strings --silent --build-info --build-info-path --eof --skip --ast --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --froms --interactives --private-keys --private-key --mnemonics --mnemonic-passphrases --mnemonic-derivation-paths --mnemonic-indexes --keystores --keystore --accounts --account --password --password-file --ledger --trezor --aws --rpc-url --fork-url --fork-block-number --fork-retries --fork-retry-backoff --no-storage-caching --initial-balance --sender --ffi --always-use-create-2-factory --verbosity --compute-units-per-second --no-rate-limit --no-rpc-rate-limit --gas-limit --code-size-limit --chain-id --chain --gas-price --base-fee --block-base-fee-per-gas --tx-origin --block-coinbase --block-timestamp --block-number --block-difficulty --block-prevrandao --block-gas-limit --memory-limit --no-gas-limit --disable-block-gas-limit --isolate --alphanet --verifier --verifier-url --retries --delay --help <PATH> [ARGS]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --target-contract)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --tc)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --sig)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -s)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --priority-gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --batch-size)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-estimate-multiplier)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -g)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --etherscan-api-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --with-gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --timeout)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -o)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --skip)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --froms)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -a)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --interactives)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -i)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --private-keys)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --private-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mnemonics)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mnemonic-passphrases)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mnemonic-derivation-paths)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mnemonic-indexes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keystore)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keystores)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --account)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --accounts)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --password)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --password-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rpc-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-retries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-retry-backoff)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --initial-balance)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --sender)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --compute-units-per-second)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --code-size-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain-id)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-base-fee-per-gas)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --base-fee)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --tx-origin)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-coinbase)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-timestamp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-difficulty)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-prevrandao)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --memory-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verifier)
                    COMPREPLY=($(compgen -W "etherscan sourcify blockscout oklink" -- "${cur}"))
                    return 0
                    ;;
                --verifier-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --retries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__selectors)
            opts="-h --help collision co upload up list ls find f help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__selectors)
            opts="-h --help collision co upload up list ls find f help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__selectors__collision)
            opts="-o -C -R -h --force --no-cache --libraries --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --no-metadata --out --revert-strings --silent --build-info --build-info-path --eof --skip --ast --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --help <FIRST_CONTRACT> <SECOND_CONTRACT>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -o)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --skip)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__selectors__collision)
            opts="-o -C -R -h --force --no-cache --libraries --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --no-metadata --out --revert-strings --silent --build-info --build-info-path --eof --skip --ast --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --help <FIRST_CONTRACT> <SECOND_CONTRACT>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -o)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --skip)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__selectors__find)
            opts="-C -R -h --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --help <SELECTOR>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__selectors__find)
            opts="-C -R -h --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --help <SELECTOR>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__selectors__help)
            opts="collision upload list find help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__selectors__help__collision)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__selectors__help__find)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__selectors__help__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__selectors__help__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__selectors__help__upload)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__selectors__list)
            opts="-C -R -h --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --help [CONTRACT]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__selectors__list)
            opts="-C -R -h --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --help [CONTRACT]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__selectors__upload)
            opts="-C -R -h --all --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --help [CONTRACT]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__selectors__upload)
            opts="-C -R -h --all --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --help [CONTRACT]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__snapshot)
            opts="-l -j -f -v -o -C -R -w -h --diff --check --format --snap --tolerance --debug --flamegraph --flamechart --decode-internal --gas-report --allow-failure --json --junit --fail-fast --etherscan-api-key --list --fuzz-seed --fuzz-runs --fuzz-input-file --jobs --threads --show-progress --mt --match-test --nmt --no-match-test --mc --match-contract --nmc --no-match-contract --mp --match-path --nmp --no-match-path --nmco --no-match-coverage --rerun --rpc-url --fork-url --fork-block-number --fork-retries --fork-retry-backoff --no-storage-caching --initial-balance --sender --ffi --always-use-create-2-factory --verbosity --compute-units-per-second --no-rate-limit --no-rpc-rate-limit --gas-limit --code-size-limit --chain-id --chain --gas-price --base-fee --block-base-fee-per-gas --tx-origin --block-coinbase --block-timestamp --block-number --block-difficulty --block-prevrandao --block-gas-limit --memory-limit --no-gas-limit --disable-block-gas-limit --isolate --alphanet --force --no-cache --libraries --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --no-metadata --out --revert-strings --silent --build-info --build-info-path --eof --skip --ast --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --watch --no-restart --run-all --watch-delay --summary --detailed --asc --desc --min --max --help [PATH]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --diff)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --check)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --format)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --snap)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --tolerance)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --debug)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --decode-internal)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --etherscan-api-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fuzz-seed)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fuzz-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fuzz-input-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --threads)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --jobs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -j)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --match-test)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mt)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-test)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmt)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --match-contract)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mc)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-contract)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmc)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --match-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-coverage)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmco)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rpc-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-retries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-retry-backoff)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --initial-balance)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --sender)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --compute-units-per-second)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --code-size-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain-id)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-base-fee-per-gas)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --base-fee)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --tx-origin)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-coinbase)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-timestamp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-difficulty)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-prevrandao)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --memory-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -o)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --skip)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --watch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -w)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --watch-delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --min)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --max)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__snapshot)
            opts="-l -j -f -v -o -C -R -w -h --diff --check --format --snap --tolerance --debug --flamegraph --flamechart --decode-internal --gas-report --allow-failure --json --junit --fail-fast --etherscan-api-key --list --fuzz-seed --fuzz-runs --fuzz-input-file --jobs --threads --show-progress --mt --match-test --nmt --no-match-test --mc --match-contract --nmc --no-match-contract --mp --match-path --nmp --no-match-path --nmco --no-match-coverage --rerun --rpc-url --fork-url --fork-block-number --fork-retries --fork-retry-backoff --no-storage-caching --initial-balance --sender --ffi --always-use-create-2-factory --verbosity --compute-units-per-second --no-rate-limit --no-rpc-rate-limit --gas-limit --code-size-limit --chain-id --chain --gas-price --base-fee --block-base-fee-per-gas --tx-origin --block-coinbase --block-timestamp --block-number --block-difficulty --block-prevrandao --block-gas-limit --memory-limit --no-gas-limit --disable-block-gas-limit --isolate --alphanet --force --no-cache --libraries --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --no-metadata --out --revert-strings --silent --build-info --build-info-path --eof --skip --ast --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --watch --no-restart --run-all --watch-delay --summary --detailed --asc --desc --min --max --help [PATH]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --diff)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --check)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --format)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --snap)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --tolerance)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --debug)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --decode-internal)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --etherscan-api-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fuzz-seed)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fuzz-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fuzz-input-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --threads)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --jobs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -j)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --match-test)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mt)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-test)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmt)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --match-contract)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mc)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-contract)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmc)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --match-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-coverage)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmco)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rpc-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-retries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-retry-backoff)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --initial-balance)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --sender)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --compute-units-per-second)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --code-size-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain-id)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-base-fee-per-gas)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --base-fee)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --tx-origin)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-coinbase)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-timestamp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-difficulty)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-prevrandao)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --memory-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -o)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --skip)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --watch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -w)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --watch-delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --min)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --max)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__soldeer)
            opts="-h --help init install update login push uninstall version help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__soldeer__help)
            opts="init install update login push uninstall version help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__soldeer__help__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__soldeer__help__init)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__soldeer__help__install)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__soldeer__help__login)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__soldeer__help__push)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__soldeer__help__uninstall)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__soldeer__help__update)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__soldeer__help__version)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__soldeer__init)
            opts="-h --clean --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__soldeer__install)
            opts="-g -d -h --rev --tag --branch --regenerate-remappings --recursive-deps --help [DEPENDENCY~VERSION] [URL]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --rev)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --tag)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --branch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__soldeer__login)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__soldeer__push)
            opts="-d -h --dry-run --skip-warnings --help <DEPENDENCY>~<VERSION> [PATH]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__soldeer__uninstall)
            opts="-h --help <DEPENDENCY>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__soldeer__update)
            opts="-g -d -h --regenerate-remappings --recursive-deps --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__soldeer__version)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__test)
            opts="-l -j -f -v -o -C -R -w -h --debug --flamegraph --flamechart --decode-internal --gas-report --allow-failure --json --junit --fail-fast --etherscan-api-key --list --fuzz-seed --fuzz-runs --fuzz-input-file --jobs --threads --show-progress --mt --match-test --nmt --no-match-test --mc --match-contract --nmc --no-match-contract --mp --match-path --nmp --no-match-path --nmco --no-match-coverage --rerun --rpc-url --fork-url --fork-block-number --fork-retries --fork-retry-backoff --no-storage-caching --initial-balance --sender --ffi --always-use-create-2-factory --verbosity --compute-units-per-second --no-rate-limit --no-rpc-rate-limit --gas-limit --code-size-limit --chain-id --chain --gas-price --base-fee --block-base-fee-per-gas --tx-origin --block-coinbase --block-timestamp --block-number --block-difficulty --block-prevrandao --block-gas-limit --memory-limit --no-gas-limit --disable-block-gas-limit --isolate --alphanet --force --no-cache --libraries --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --no-metadata --out --revert-strings --silent --build-info --build-info-path --eof --skip --ast --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --watch --no-restart --run-all --watch-delay --summary --detailed --help [PATH]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --debug)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --decode-internal)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --etherscan-api-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fuzz-seed)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fuzz-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fuzz-input-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --threads)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --jobs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -j)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --match-test)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mt)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-test)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmt)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --match-contract)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mc)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-contract)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmc)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --match-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-coverage)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmco)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rpc-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-retries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-retry-backoff)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --initial-balance)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --sender)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --compute-units-per-second)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --code-size-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain-id)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-base-fee-per-gas)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --base-fee)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --tx-origin)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-coinbase)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-timestamp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-difficulty)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-prevrandao)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --memory-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -o)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --skip)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --watch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -w)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --watch-delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__test)
            opts="-l -j -f -v -o -C -R -w -h --debug --flamegraph --flamechart --decode-internal --gas-report --allow-failure --json --junit --fail-fast --etherscan-api-key --list --fuzz-seed --fuzz-runs --fuzz-input-file --jobs --threads --show-progress --mt --match-test --nmt --no-match-test --mc --match-contract --nmc --no-match-contract --mp --match-path --nmp --no-match-path --nmco --no-match-coverage --rerun --rpc-url --fork-url --fork-block-number --fork-retries --fork-retry-backoff --no-storage-caching --initial-balance --sender --ffi --always-use-create-2-factory --verbosity --compute-units-per-second --no-rate-limit --no-rpc-rate-limit --gas-limit --code-size-limit --chain-id --chain --gas-price --base-fee --block-base-fee-per-gas --tx-origin --block-coinbase --block-timestamp --block-number --block-difficulty --block-prevrandao --block-gas-limit --memory-limit --no-gas-limit --disable-block-gas-limit --isolate --alphanet --force --no-cache --libraries --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --no-metadata --out --revert-strings --silent --build-info --build-info-path --eof --skip --ast --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --watch --no-restart --run-all --watch-delay --summary --detailed --help [PATH]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --debug)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --decode-internal)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --etherscan-api-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fuzz-seed)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fuzz-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fuzz-input-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --threads)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --jobs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -j)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --match-test)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mt)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-test)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmt)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --match-contract)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mc)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-contract)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmc)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --match-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-coverage)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmco)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rpc-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-retries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-retry-backoff)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --initial-balance)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --sender)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --compute-units-per-second)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --code-size-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain-id)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-base-fee-per-gas)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --base-fee)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --tx-origin)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-coinbase)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-timestamp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-difficulty)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-prevrandao)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --memory-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -o)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --skip)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --watch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -w)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --watch-delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__tree)
            opts="-C -R -h --no-dedupe --charset --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --charset)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__tree)
            opts="-C -R -h --no-dedupe --charset --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --charset)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                -C)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --config-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__update)
            opts="-f -r -h --root --force --recursive --help [DEPENDENCIES]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__update)
            opts="-f -r -h --root --force --recursive --help [DEPENDENCIES]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__verify__bytecode)
            opts="-r -e -c -h --block --constructor-args --encoded-constructor-args --constructor-args-path --rpc-url --etherscan-api-key --chain --verifier --verifier-url --json --root --ignore --help <ADDRESS> <CONTRACT>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --block)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --constructor-args)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --encoded-constructor-args)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --constructor-args-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --rpc-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --etherscan-api-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -e)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verifier)
                    COMPREPLY=($(compgen -W "etherscan sourcify blockscout oklink" -- "${cur}"))
                    return 0
                    ;;
                --verifier-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --ignore)
                    COMPREPLY=($(compgen -W "creation runtime" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__verify__bytecode)
            opts="-r -e -c -h --block --constructor-args --encoded-constructor-args --constructor-args-path --rpc-url --etherscan-api-key --chain --verifier --verifier-url --json --root --ignore --help <ADDRESS> <CONTRACT>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --block)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --constructor-args)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --encoded-constructor-args)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --constructor-args-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --rpc-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --etherscan-api-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -e)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verifier)
                    COMPREPLY=($(compgen -W "etherscan sourcify blockscout oklink" -- "${cur}"))
                    return 0
                    ;;
                --verifier-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --ignore)
                    COMPREPLY=($(compgen -W "creation runtime" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__verify__check)
            opts="-e -c -h --retries --delay --etherscan-api-key --chain --verifier --verifier-url --help <ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --retries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --etherscan-api-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -e)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verifier)
                    COMPREPLY=($(compgen -W "etherscan sourcify blockscout oklink" -- "${cur}"))
                    return 0
                    ;;
                --verifier-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__verify__check)
            opts="-e -c -h --retries --delay --etherscan-api-key --chain --verifier --verifier-url --help <ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --retries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --etherscan-api-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -e)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verifier)
                    COMPREPLY=($(compgen -W "etherscan sourcify blockscout oklink" -- "${cur}"))
                    return 0
                    ;;
                --verifier-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__verify__contract)
            opts="-f -e -c -r -h --encoded-constructor-args --constructor-args --constructor-args-path --guess-constructor-args --compiler-version --optimizer-runs --num-of-optimizations --flatten --force --skip-is-verified-check --watch --libraries --root --show-standard-json-input --via-ir --evm-version --etherscan-api-key --chain --rpc-url --flashbots --jwt-secret --retries --delay --verifier --verifier-url --help <ADDRESS> [CONTRACT]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --constructor-args)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --encoded-constructor-args)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --constructor-args-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --compiler-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --num-of-optimizations)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --etherscan-api-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -e)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rpc-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --jwt-secret)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --retries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verifier)
                    COMPREPLY=($(compgen -W "etherscan sourcify blockscout oklink" -- "${cur}"))
                    return 0
                    ;;
                --verifier-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__verify__contract)
            opts="-f -e -c -r -h --encoded-constructor-args --constructor-args --constructor-args-path --guess-constructor-args --compiler-version --optimizer-runs --num-of-optimizations --flatten --force --skip-is-verified-check --watch --libraries --root --show-standard-json-input --via-ir --evm-version --etherscan-api-key --chain --rpc-url --flashbots --jwt-secret --retries --delay --verifier --verifier-url --help <ADDRESS> [CONTRACT]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --constructor-args)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --encoded-constructor-args)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --constructor-args-path)
                    local oldifs
                    if [ -n "${IFS+x}" ]; then
                        oldifs="$IFS"
                    fi
                    IFS=$'\n'
                    COMPREPLY=($(compgen -f "${cur}"))
                    if [ -n "${oldifs+x}" ]; then
                        IFS="$oldifs"
                    fi
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o filenames
                    fi
                    return 0
                    ;;
                --compiler-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --num-of-optimizations)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --etherscan-api-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -e)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rpc-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --jwt-secret)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --retries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verifier)
                    COMPREPLY=($(compgen -W "etherscan sourcify blockscout oklink" -- "${cur}"))
                    return 0
                    ;;
                --verifier-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
    esac
}

if [[ "${BASH_VERSINFO[0]}" -eq 4 && "${BASH_VERSINFO[1]}" -ge 4 || "${BASH_VERSINFO[0]}" -gt 4 ]]; then
    complete -F _forge -o nosort -o bashdefault -o default forge
else
    complete -F _forge -o bashdefault -o default forge
fi
