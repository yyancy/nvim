import os
import platform

# for k in os.environ:
# print(k,os.environ[k])

# set environment varible XDG_CONFIG_HOME to user home path.
base_path = os.environ['USERPROFILE']
# command =r"setx XDG_CONFIG_HOME %s /m"%path
# os.system(command)


def check_path(dir):
    path = os.path.join(base_path, dir)
    if not os.path.exists(path):
        os.makedirs(path)
        print('create dictionary: ', path)
    else:
        print('dictionary already existed', path)


def setEnviron():
    check_path('nvim')


if  __name__ == "__main__":
   print(platform.platform().find('Windo2ws'))
