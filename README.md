Contentia DDEV
==============

Preparations
------------

Clone this template

```bash
git clone https://github.com/ptomulik/jmc-ddev.git && cd jmc-ddev/
```

Create ``.ddev/config.local.yaml`` to customize the installation for your
website:

```bash
php tools/setup-ddev-project.php {projectname}
```

adjust the config, if necessary, see [config.yaml documentation](https://ddev.readthedocs.io/en/stable/users/configuration/config_yaml/).


Clone your project into ``web/`` subdirectory:

```bash
git clone git@dev7.jmc.pl:jmc/{projectname}.git web
```

Start ddev docker containers:

```bash
ddev start
```

Create database and populate it with inital data.

```bash
ddev import-db --src=./web/SQL_Base_start_structure.sql
ddev import-db --no-drop --src=./web/SQL_Base_start_data.sql
```

Patch database for ddev

```bash
ddev exec .ddev/patch-contentia-db.sh
```
