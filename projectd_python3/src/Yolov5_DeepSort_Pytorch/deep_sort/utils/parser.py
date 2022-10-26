import os
import sys
sys.path.append("Python/Yolov5_DeepSort_Pytorch_test/deep_sort")
sys.path.append("Python/Yolov5_DeepSort_Pytorch_test/deep_sort/configs/deep_sort.yaml")

import yaml
from easydict import EasyDict as edict

config_file1="Python/Yolov5_DeepSort_Pytorch_test/deep_sort/configs/deep_sort.yaml"
class YamlParser(edict):
    """
    This is yaml parser based on EasyDict.
    """

    def __init__(self, cfg_dict=None, config_file1=None):
        if cfg_dict is None:
            cfg_dict = {}

        if config_file1 is not None:
            assert(os.path.isfile(config_file1))
            with open(config_file1, 'r') as fo:
                yaml_ = yaml.load(fo.read(), Loader=yaml.FullLoader)
                cfg_dict.update(yaml_)

        super(YamlParser, self).__init__(cfg_dict)

    def merge_from_file(self, config_file1):
        with open("Python/Yolov5_DeepSort_Pytorch_test/deep_sort/configs/deep_sort.yaml", 'r') as fo:
            yaml_ = yaml.load(fo.read(), Loader=yaml.FullLoader)
            self.update(yaml_)

    def merge_from_dict(self, config_dict):
        self.update(config_dict)


def get_config(config_file1=None):
    return YamlParser(config_file1=config_file1)


if __name__ == "__main__":
    cfg = YamlParser(config_file="../configs/yolov3.yaml")
    cfg.merge_from_file("../configs/deep_sort.yaml")

    import ipdb
    ipdb.set_trace()
