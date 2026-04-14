# libreFS Erasure Code Quickstart Guide [![Slack](https://slack.min.io/slack?type=svg)](https://slack.min.io)

libreFS protects data against hardware failures and silent data corruption using erasure code and checksums. With the highest level of redundancy, you may lose up to half (N/2) of the total drives and still be able to recover the data.

## What is Erasure Code?

Erasure code is a mathematical algorithm to reconstruct missing or corrupted data. libreFS uses Reed-Solomon code to shard objects into variable data and parity blocks. For example, in a 12 drive setup, an object can be sharded to a variable number of data and parity blocks across all the drives - ranging from six data and six parity blocks to ten data and two parity blocks.

By default, libreFS shards the objects across N/2 data and N/2 parity drives. Though, you can use [storage classes](https://github.com/minio/minio/tree/master/docs/erasure/storage-class) to use a custom configuration. We recommend N/2 data and parity blocks, as it ensures the best protection from drive failures.

In 12 drive example above, with libreFS server running in the default configuration, you can lose any of the six drives and still reconstruct the data reliably from the remaining drives.

## Why is Erasure Code useful?

Erasure code protects data from multiple drives failure, unlike RAID or replication. For example, RAID6 can protect against two drive failure whereas in libreFS erasure code you can lose as many as half of drives and still the data remains safe. Further, libreFS's erasure code is at the object level and can heal one object at a time. For RAID, healing can be done only at the volume level which translates into high downtime. As libreFS encodes each object individually, it can heal objects incrementally. Storage servers once deployed should not require drive replacement or healing for the lifetime of the server. libreFS's erasure coded backend is designed for operational efficiency and takes full advantage of hardware acceleration whenever available.

![Erasure](https://github.com/minio/minio/blob/master/docs/screenshots/erasure-code.jpg?raw=true)

## What is Bit Rot protection?

Bit Rot, also known as data rot or silent data corruption is a data loss issue faced by disk drives today. Data on the drive may silently get corrupted without signaling an error has occurred, making bit rot more dangerous than a permanent hard drive failure.

libreFS's erasure coded backend uses high speed [HighwayHash](https://github.com/minio/highwayhash) checksums to protect against Bit Rot.

## How are drives used for Erasure Code?

libreFS divides the drives you provide into erasure-coding sets of *2 to 16* drives.  Therefore, the number of drives you present must be a multiple of one of these numbers.  Each object is written to a single erasure-coding set.

Minio uses the largest possible EC set size which divides into the number of drives given. For example, *18 drives* are configured as *2 sets of 9 drives*, and *24 drives* are configured as *2 sets of 12 drives*.  This is true for scenarios when running libreFS as a standalone erasure coded deployment. In [distributed setup however node (affinity) based](https://docs.min.io/community/minio-object-store/operations/install-deploy-manage/deploy-minio-multi-node-multi-drive.html) erasure stripe sizes are chosen.

The drives should all be of approximately the same size.

## Get Started with libreFS in Erasure Code

### 1. Prerequisites

Install libreFS - [libreFS Quickstart Guide](https://docs.min.io/community/minio-object-store/operations/deployments/baremetal-deploy-minio-on-redhat-linux.html)

### 2. Run libreFS Server with Erasure Code

Example: Start libreFS server in a 12 drives setup, using libreFS binary.

```sh
librefs server /data{1...12}
```

Example: Start libreFS server in a 8 drives setup, using libreFS Docker image.

```sh
podman run \
  -p 9000:9000 \
  -p 9001:9001 \
  --name minio \
  -v /mnt/data1:/data1 \
  -v /mnt/data2:/data2 \
  -v /mnt/data3:/data3 \
  -v /mnt/data4:/data4 \
  -v /mnt/data5:/data5 \
  -v /mnt/data6:/data6 \
  -v /mnt/data7:/data7 \
  -v /mnt/data8:/data8 \
  quay.io/minio/librefs server /data{1...8} --console-address ":9001"
```

### 3. Test your setup

You may unplug drives randomly and continue to perform I/O on the system.
