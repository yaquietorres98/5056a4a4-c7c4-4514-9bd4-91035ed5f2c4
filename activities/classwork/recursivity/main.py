import fire
import logging

from util import TriangleBuilder


class Main(object):

    def message(self, content):
        logging.info(content)

    def get_element_recursively(self, i, j):
        return  if (j>= i or j == 0) else\
    self.get_element_recursively(i=i-1, j=j) + \
    self.get_element_recursively(i=i-1, j=j-1) 
    
    def pascal_triangle_a(self, level, index=0):
        if (index<level):
            row = [str(self.get_element_recursively(i=index, j=j))
                   for j in range(index + 1)]
            print("".join(row))
            self.pascal_triangle_a(level=level, index=index+1)

    def pascal_triangle_b(self, level, index=0):
        if index < level:
            row buld

    def pascal_triangle(self, level, option):
        pass


if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO)
    fire.Fire(Main)
