function _trash_empty
    set trash ~/.Trash/{,.}*

    if test -n "$trash"
        read -P "trash: empty the Trash? [y/N] " confirm

        if test (string lower $confirm) = y
            command osascript -e 'tell app "Finder" to empty trash'
        end
    else
        echo trash: trash is empty
    end
end
