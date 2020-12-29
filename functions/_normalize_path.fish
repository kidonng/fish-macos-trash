function _normalize_path -a path
  set comps (string split / $path)

  if string match -q '/*' $path
    set new_comps ''
  else
    set new_comps (string split / $PWD)
  end

  for comp in $comps
    switch $comp
      case '' .
      case ..
        set -e new_comps[-1]
      case \*
        set -a new_comps $comp
    end
  end

  if test -z "$new_comps"
    echo /
  else
    string join / $new_comps
  end
end
