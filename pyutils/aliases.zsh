_mamba_run() {
    micromamba run -n pyutils "$@"
}

alias visidata='_mamba_run visidata'
alias vd='_mamba_run vd'
alias httpie='_mamba_run httpie'
alias pre-commit='_mamba_run pre-commit'
alias cookiecutter='_mamba_run cookiecutter'
