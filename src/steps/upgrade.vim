function! s:main() abort

    if exists(":AstroUpdate")
        " AstroUpdate calls Lazy, then Mason. So we return early.
        " Add to init.lua:
        " updater = {
        "   skip_prompts = true,
        " },
        echo "AstroUpdate"
        augroup _astro_batch | autocmd!
            autocmd User MasonToolsUpdateCompleted ++once quitall
        augroup END
        AstroUpdate
        return
    endif

    if exists(":MasonUpdate")
        echo "MasonUpdate"
        MasonUpdate
    endif

    if exists(":NeoBundleUpdate")
        echo "NeoBundle"
        NeoBundleUpdate
    endif

    if exists(":PluginUpdate")
        echo "Plugin"
        PluginUpdate
    endif

    if exists(":PlugUpgrade")
        echo "Plug"
        PlugUpgrade
        if $TOPGRADE_FORCE_PLUGUPDATE
            PlugUpdate!
        else
            PlugUpdate
        endif
    endif

    if exists("*dein#update()")
        echo "dein#update()"
        call dein#update()
    endif

    if exists(":DeinUpdate")
        echo "DeinUpdate"
        DeinUpdate
    endif

    if exists(":PaqUpdate")
        echo "PaqUpdate"
        PaqUpdate
    endif

    if exists(":Lazy")
        echo "Lazy Update"
        Lazy! sync | qa
    endif

    if exists(':PackerSync')
        echo "Packer"
        autocmd User PackerComplete quitall
        PackerSync
    else
        quitall
    endif
endfunction

call s:main()
