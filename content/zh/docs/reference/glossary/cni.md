---
title: CNI
test: n/a
---

[容器网络接口（CNI）](https://www.cni.dev/) 是 Kubernetes 用于配置集群网络的标准。
它是使用**插件**实现的，有两种类型的插件：

* **interface** 插件，创建网络接口，由集群运营商提供
* **chained** 插件，可以配置创建的接口，可以由集群上安装的软件提供

Istio 可以在 Sidecar 和 Ambient 模式下与所有遵循 CNI 标准的 CNI 实现配合使用。

为了配置网格流量重定向，Istio 包含一个 [CNI 节点代理](/zh/docs/setup/additional-setup/cni/)。
此代理会安装一个链式 CNI 插件，该插件在所有已配置的 CNI 接口插件之后运行。

CNI 节点代理对于 {{< gloss >}}sidecar{{< /gloss >}} 模式是可选的，
而对于 {{< gloss >}}ambient{{< /gloss >}} 模式是必需的。
