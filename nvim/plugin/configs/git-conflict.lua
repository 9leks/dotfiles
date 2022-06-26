local git_conflict = import 'git-conflict'

if not git_conflict then
    return
end

git_conflict.setup {}
