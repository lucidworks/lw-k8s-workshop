
# Lab1
## Corrections/Observations
Described below are potential errors in the steps that needs correction.  They are minor issues.


## Step 2:
```
kubectl —namespace efordelon get service proxy -o jsonpath=‘{.status.loadBalancer.ingress[0].hostname}'
```
Given that we don’t have ingress, the -o jsonpath is not necessary.   Simply issuing the command below does return the right hostname, port that we're looking for

```
kubectl —namespace efordelon get service proxy 
```


## Step 3: Upgrade to Latest Fusion 5.0.3-2

```
The setup script created a new shell script named gke_proserve-trng_efordelon_fusion_upgrade.sh in the fusion-cloud-native directory.

```

The fusion_upgrade should be reversed - upgrade_fusion:
```
The setup script created a new shell script named gke_proserve-trng_efordelon_upgrade_fusion.sh in the fusion-cloud-native directory.
```

## Step 4
### Verifying the Fusion Installation 
### Useful kubectl commands
https://github.com/lucidworks/fusion-cloud-native#verifying

```
Get logs for a pod using a label: k logs –l app.kubernetes.io/component=query-pipeline
```

If you copy and paste the command above, there's an error:
```
Error from server (NotFound): pods "–l" not found
```

That's because the minus sign above is not a regular minus sign character.
