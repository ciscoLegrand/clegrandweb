delete = {
  tech: 'git',
  command: 'branch',
  label: 'delete/remove',
  command: 'delete',
  usage: 'git branch -D <branch name>',
  level: 1,
  options: [
    {
      value: 'branch',
      label: 'a branch',
      usage: 'git branch -D <branch name>'
    },
    {
      value: 'delete-multiple-branches',
      label: 'multiple branches',
    },
    {
      value: 'tag',
      label: 'a tag',
      usage: 'git tag -d v<tag version>'
    },
    {
      value: 'remote',
      label: 'remote',
      usage: 'git remote rm <remote>'
    },
    {
      value: 'untracked-files',
      label: 'untracked files',
      usage: 'git clean -<flag>',
      nb:
        'replace -<flag> with:\n -i for interactive command\n -n to preview what will be removed\n -f to remove forcefully\n -d to remove directories\n -X to remove ignored files\n -x to remove ignored and non-ignored files'
    },
    {
      value: 'files-from-index',
      label: 'files from index',
      usage: 'git rm --cached <file or dir>',
      nb:
        'Use this option to unstage and remove paths only from the index. Working tree files, whether modified or not, will be left alone.'
    },
    {
      value: 'local-branches-not-on-remote',
      label: "local branches that don't exist at remote",
      usage: 'git remote prune <remote-name>',
      nb:
        'Use the --dry-run option to report what branches will be pruned, but do not actually prune them'
    },
    {
      value: 'files-from-old-commit',
      label: 'files from old commits',
      usage:
        "git filter-branch --index-filter \n'git rm --cached --ignore-unmatch path/to/mylarge_file' \n--tag-name-filter cat -- --all\n\nfilter-branch keeps backups too, so the size of the repo won't decrease immediately unless you expire the reflogs and garbage collect:\n\nrm -Rf .git/refs/original       # careful\ngit gc --aggressive --prune=now # danger",
      nb:
        "Like the rebasing option described before, filter-branch is rewriting operation. If you have published history, you'll have to --force push the new refs."
    }
  ]
}





