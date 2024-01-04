# Maintenance

## Add new repository

Add remote
```bash
git remote add magit https://github.com/magit/magit.git
```

Fetch remote only main/master branch
```bash
git fetch magit main
```

Make new branch from magit/main
```bash
git checkout -b magit/main magit/main
```

Make new branch from docs
```bash
git subtree split --prefix=docs -b magit/docs --rejoin
```

Checkout master
```bash
git checkout master
```

Add subtree at orig/magit
```bash
git subtree add --prefix=orig/magit magit/docs
```

## Update repository

Fetch, checkout, merge remote only main/master branch
```bash
git fetch magit main
git checkout magit/main
git merge remotes/magit/main --no-edit
```

Merge subtree
```bash
git checkout master
git subtree merge --prefix=orig/magit magit/docs
```
