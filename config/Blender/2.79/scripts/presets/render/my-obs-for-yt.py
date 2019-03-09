import bpy
scene = bpy.context.scene

scene.render.field_order = 'EVEN_FIRST'
scene.render.fps = 5733
scene.render.fps_base = 191.0
scene.render.pixel_aspect_x = 1.0
scene.render.pixel_aspect_y = 1.0
scene.render.resolution_percentage = 100
scene.render.resolution_x = 1728
scene.render.resolution_y = 1072
scene.render.use_fields = True
scene.render.use_fields_still = False
