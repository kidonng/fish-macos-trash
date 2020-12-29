function _trash_list
    argparse -i v/verbose -- $argv

    set trash ~/.Trash/{,.}*

    if test -n "$trash"
        if set -q _flag_verbose
            command du -hcs $trash
            echo trash: (count $trash) files in total
        else
            string collect $trash
        end
    else
        echo trash: nothing to list
    end
end
