alias d='docker $*'
alias d-c='docker-compose $*'


alias docker-kill-all='docker kill `docker ps -aq`'
alias docker-rm-all='docker rm `docker ps -aq`'

# from https://github.com/alexjc/neural-enhance
alias enhance='function ne() { docker run --rm -v "$(pwd)/`dirname ${@:$#}`":/ne/input -it alexjc/neural-enhance ${@:1:$#-1} "input/`basename ${@:$#}`"; }; ne'

