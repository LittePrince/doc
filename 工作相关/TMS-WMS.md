```sequence
WMS->ERP:请求订单
ERP->WMS:订单
TMS->WMS:请求订单生成波捡
WMS->TMS:生成ERP波捡策略
TMS->WMS:计算目的地路径后把一批ERP波捡的策略ID给WMS

```

第一步：保存了policyErp,生成了WaveSortNum策略唯一码

```java
WaveSortPolicyErp policyErp = new WaveSortPolicyErp();
        Date now = new Date();
        long time = now.getTime();
        policyErp.setCreateTime(now);
        policyErp.setWaveSortNum(String.valueOf(time));
        Set<ErpTradeDelivery> deliverySet = new HashSet<>(erpTradeDeliveries);
        policyErp.setTradeDeliveries(deliverySet);
        waveSortPolicyErpRepository.save(policyErp); 
```

第二步：通过策略唯一码来构造

```java
Date createTime = new Date();
        String waveSortNum = waveSortPolicyErp.getWaveSortNum();
        Set<ErpTradeDelivery> tradeDeliveries = waveSortPolicyErp.getTradeDeliveries();
        Set<WaveSortPolicyTms> tmsSet=new HashSet<>();
        for (ErpTradeDelivery erpTradeDelivery : tradeDeliveries) {
            WaveSortPolicyTms waveSortPolicyTms = new WaveSortPolicyTms();
            waveSortPolicyTms.setWaveSortNum(waveSortNum);
            waveSortPolicyTms.setCreateTime(createTime);
            Set<ErpTradeDelivery> erpTradeDeliveries = new HashSet<>();
            erpTradeDeliveries.add(erpTradeDelivery);
            waveSortPolicyTms.setTradeDeliveries(erpTradeDeliveries);
            waveSortPolicyTmsRepository.save(waveSortPolicyTms);
            tmsSet.add(waveSortPolicyTms);
        }
        return tmsSet;
```

