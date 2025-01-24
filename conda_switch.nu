def --env _z_do_conda_activate [] {
    let env_name = if ('environment-dev.yml' | path exists) {
        # Try environment-dev.yml first
        open environment-dev.yml | get name
    } else if ('environment.yml' | path exists) {
        # Fall back to environment.yml
        open environment.yml | get name
    } else {
        null
    }

    if ($env_name != null) {
        $env.CONDACONFIGDIR = (pwd)
        mamba activate $env_name
    } else if ($env.CONDACONFIGDIR? != null) {
        if (not ((pwd | str contains $env.CONDACONFIGDIR))) {
            hide-env CONDACONFIGDIR
            mamba deactivate
        }
    }
}

$env.config = ($env.config | upsert hooks.env_change.PWD [{|before, after|
    if ($env.CONDA_SHLVL? != null) {
        _z_do_conda_activate
    }
}])

if ($env.CONDA_SHLVL? != null) {
    $env.CONDACONFIGDIR = null
    _z_do_conda_activate
}
