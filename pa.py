from pyautocad import Autocad, APoint
acad = Autocad(create_if_not_exists=True)

for text in acad.iter_objects('Text'):
    print(text.TextString, text.InsertionPoint)
