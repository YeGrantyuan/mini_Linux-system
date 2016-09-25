#!/bash/bin

#This is the shell for installing openssh server

#constant difine
APP_PACK="openssh.tar.gz"
INSTALL_DIR="/usr/local/bin"
CONFIG_DIR="/usr/local/etc"
LIB_DIR="/usr/local/libexec"
USBIN_DIR="/usr/local/sbin"
INIT_DIR="/etc/rc.d/init.d"
ADD_USER="sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin"
PASSWD="/etc/passwd"
SERVER="/etc/rc.d/init.d/sshd"
START="/etc/init.d/rcS"

# 1.Checking the install file exsit or not Download addr: 
echo "[1] Checking the install file exsit ..."
if [ ! -e "./APP_PACK" ] then
	echo "./APP_PACK not exit.Getting it from https://github.com/YeGrantyuan/mini_Linux-system/tree/master/system_portability/openssh_for_arm"
fi

# 2.Checking the install directory exsit or not
echo "[2]Checking out the install directory exsit or not ..."
if [! -d "$INSTALL_DIR" ];then
	echo "Creating install directory ..."
	mkdir -p $INSTALL_DIR
fi

if [! -d "$CONFIG_DIR" ];then
	echo "Creating configuration directory ..."
	mkdir -p /$CONFIG_DIR
fi

if [! -d "$LIB_DIR" ];then
	echo "Creating libexec directory ..."
	mkdir -p /$LIB_DIR
fi

if [! -d "$USBIN_DIR" ];then
	echo "Creating sbin  directory ..."
	mkdir -p /$USBIN_DIR
fi

if [! -d "$INIT_DIR" ];then
	echo "Creating sbin  directory ..."
	mkdir -p /$INIT_DIR
fi


# 3.Uncompressing the isntall file 
echo "[3] Uncompressing the isntall file"
tar -xzvf ./APP_PACK -C /

# 4.Linking openssh bash to system bash
echo "[4] Linking openssh bash to system bash"
ln -s $INSTALL_DIR/* /usr/bin/ 
sleep 2

# 5.Add a automactically user for openssh server
echo "[5] Add a automactically user for openssh server"
echo "$ADD_USER" >> $PASSWD
sleep 1

# 6.Appending automactically start configuration
echo "[6]Appending automactically start configuration"
echo "$SERVER start" >> $START
$SERVER start
mkdir -p /var/empty
