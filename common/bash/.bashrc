# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

for fragment in ~/.bashd/*.sh; do
    source $fragment
done
