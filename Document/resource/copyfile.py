import os
import shutil

dir = "./IconFilter"
dst_dir = "./images"
ext_list = [".png"]

def copyfile(dir_path):
    for sub_name in os.listdir(dir_path):
        sub_path = os.path.join(dir_path, sub_name);

        if os.path.isdir(sub_path):
            copyfile(sub_path);
        else:
            ext = os.path.splitext(sub_path)[-1]
            if ext in ext_list:
                tmp_name = os.path.basename(dir_path).split(".")[0]
                dst_name = tmp_name + ext
                dst_path = os.path.join(dst_dir, dst_name)
                shutil.copy(sub_path, dst_path)


copyfile(dir)