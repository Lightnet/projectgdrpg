# import_plugin.gd
tool
extends EditorImportPlugin

enum Presets { PRESET_DEFAULT }

func get_preset_count():
	return Presets.size()
	
func get_preset_name(preset):
	match preset:
		PRESET_DEFAULT:
			return "Default"
		_:
			return "Unknown"
			
			
func get_import_options(preset):
	match preset:
		PRESET_DEFAULT:
			return [{
						"name": "use_red_anyway",
						"default_value": false
					}]
		_:
			return []
			
func get_option_visibility(option, options):
	return true

func get_importer_name():
	return "demos.sillymaterial"
	
func get_visible_name():
	return "Silly Material"
	
func get_recognized_extensions():
	return ["mtxt"]
	
func get_save_extension():
	return "material"
	
func get_resource_type():
	return "SpatialMaterial"
	
func import(source_file, save_path, options, r_platform_variants, r_gen_files):
	var file = File.new()
	var err = file.open(source_file, File.READ)
	if err != OK:
		return err
		
	var line = file.get_line()
	
	file.close()
	
	
	