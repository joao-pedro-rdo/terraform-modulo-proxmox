variable "pm_api_url" {
  description = "URL da API do Proxmox"
  type        = string
}

variable "pm_user" {
  description = "Usuário para autenticação no Proxmox"
  type        = string
}

variable "pm_password" {
  description = "Senha ou token do usuário"
  type        = string
  sensitive   = true
}

variable "pm_tls_insecure" {
  description = "Permitir TLS inseguro (apenas para testes)"
  type        = bool
  default     = true
}

variable "target_node" {
  # Se nao for o mesmo nome nao vai funcionar 
  description = "Nome do nó Proxmox onde o container será criad"
  type        = string
}

variable "bridge" {
  description = "Interface de bridge para o LXC"
  type        = string
  default     = "vmbr0"
}

variable "ostemplate" {
  description = "Template OS para o LXC"
  type        = string
  default     = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
}

variable "lxc_password" {
  description = "Senha padrão para os containers"
  type        = string
  sensitive   = true
}

variable "storage" {
  description = "Armazenamento utilizado para os discos dos containers"
  type        = string
  default     = "local"
}

variable "lxc_containers" {
  description = "Lista de containers para criar"
  type = object({
    # hostname  = string
    cores     = number
    memory    = number
    swap      = number
    disk_size = string
    ip        = string
  })
}

variable "num_containers" {
  description = "Numberos de containers"
  type        = number
  default     = 1
  validation {
    condition     = var.num_containers > 0
    error_message = "O número de containers deve ser maior que zero"
  }

}
variable "hostname" {
  description = "Hostname dos containers"
  type        = string
  default     = "lxc-terraform"
}

variable "ct_unprivileged" {
  description = "Privilegiado"
  type        = bool
  default     = false

}

variable "dns" {
  description = "DNS"
  type        = string
  default     = null
}
variable "tag" {
  description = "Tag para identificar os recursos"
  type        = string
  default     = null
}

variable "nesting" {
  description = "Permitir nesting"
  type        = bool
  default     = false
}
variable "fuse" {
  description = "Permitir fuse"
  type        = bool
  default     = false
}
