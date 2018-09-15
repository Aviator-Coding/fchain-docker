# <h1>Fchain - Wallet
## Dockercontainer for Fchain Wallet

Run Container:
>```docker run --name fchain-masternode-01 --restart=always -d --net mn_net -p xxx.xxx.xxx.xxx:19551:19551 -p xxx.xxx.xxx.xx:19552:19552  -v /masternode/fchain_01/.cryptocashback:/root/.cryptocashback aviator86/fchain-wallet```

> /masternode/fchain_01/.cryptocashback - is the location where you store your config on the host  
--name  fchain-masternode-01 - is the tag which will show up in the Container list name it whatever you want

Stoping Container:
>```docker stop fchain-masternode-01```

Restart Container:
>```docker restart fchain-masternode-01```

Start Container:
>```docker start fchain-masternode-01```

Delete Container: Need to stop Container First
>```docker rm fchain-masternode-01```

See Container Logs:
>```docker logs fchain-masternode-01```

## Wallet Status inside Container
See fchain Chain Status:
>```docker exec -it fchain-masternode-01 cryptocashback-cli getinfo```

See fchain Chain Masternode Status:
>```docker exec -it fchain-masternode-01 cryptocashback-cli masternode status```