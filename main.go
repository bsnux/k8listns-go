package main

import (
	"context"
	"fmt"
	"log"
	"os"

	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/tools/clientcmd"
)

func main() {
	configFile := fmt.Sprintf("%s/.kube/config", os.Getenv("HOME"))
	config, err := clientcmd.BuildConfigFromFlags("", configFile)
	if err != nil {
		log.Fatal(err)
	}
	api, err := kubernetes.NewForConfig(config)
	if err != nil {
		log.Fatal(err)
	}
	namespaces, err := api.CoreV1().Namespaces().List(context.Background(), metav1.ListOptions{})
	if err != nil {
		log.Fatal(err)
	}
	for _, ns := range namespaces.Items {
		fmt.Println(ns.Name)
	}
}
