Contentia DDEV
==============

Preparations
------------

Clone this template

```bash
git clone https://github.com/ptomulik/jmc-ddev.git && cd jmc-ddev/
```

Create ``.ddev/config.local.yaml`` to customize the installation for your
website, see [confid.yaml documentation](https://ddev.readthedocs.io/en/stable/users/extend/config_yaml/)

Make directory named ``web`` and put website's source code there. Trailing
slashes are crucial!

```bash
mkdir -p web
rsync -azv [<server>:]</path/to/source/project/> web/
```

Start ddev docker containers:

```bash
ddev start
```

Create database and populate it with inital data.

```bash
ddev import-db --src=./web/SQL_Structure.sql
ddev import-db --no-drop --src=./web/SQL_Base_start_data.sql
```

Patch database for ddev

```bash
ddev exec .ddev/patch-contentia-db.sh
```
