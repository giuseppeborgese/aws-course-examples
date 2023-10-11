module alb_north_virginia {
    source = "./modules/alb-fixed/"
    region = "us-east-1"
    name = "Global-Accelerator-Test"
    subnets_id = ["subnet-02bab1a5667b13315", "subnet-0cb5f7cbaa75e8ae7"]
}

module alb_ireland {
    source = "./modules/alb-fixed/"
    region = "eu-west-1"
    name = "alb-ireland-tmp"
    subnets_id = ["subnet-0ed5ba484688d1849", "subnet-03582af09a4cede2a"]
}

module alb_frankfurt {
    source = "./modules/alb-fixed/"
    region = "eu-central-1"
    name = "alb-ireland-tmp"
    subnets_id = ["subnet-c89c1ca3", "subnet-7d804500"]
}
