if [ ! -n "${host+set}" ]; then
    echo "target host must be supplied!"
    exit 1;
fi

pushd /app

job=$(ls /app/jobs | shuf -n1)

while true; do /app/must.pl -f jobs/$job -t ${host}:${port}; done 