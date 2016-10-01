from __future__ import print_function
from __future__ import with_statement

from fabric.api import *
from fabric.contrib.project import rsync_project
import os.path

env.use_ssh_config = True

LEVELS_DIR = os.path.join(os.path.dirname(__file__), "level")
BASE_DIR = '~/.zpack.tmp'

@parallel
def do_deploy():
    rsync_project(
        local_dir='.dist/',
        remote_dir=BASE_DIR,
        exclude=['.DS_Tore', '*.tmp', '.git', 'doc', 'man'],
        delete=True
    )
    with cd(BASE_DIR):
        run('chmod +x ./bootstrap.sh')
        run('./bootstrap.sh')
