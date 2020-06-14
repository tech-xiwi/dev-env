conky install 

1. sudo apt update && sudo apt upgrade -y && sudo apt autoremove
2. sudo apt install conky-all
3. touch ~/.conkyrc
4. vi ~/.conkyrc

content:
conky.config = {
	out_to_console = false,
	cpu_avg_samples = 2,
	net_avg_samples = 2,

	background = true,
	use_xft = true,
    	font = 'Operator Mono:LightItalic:size=7',
    	-- font = 'Dank Mono:Regular:size=8',
	xftalpha = 0.1,
	update_interval = 0.75,
	total_run_times = 0,
	
	own_window = true,
	own_window_type = 'normal',
	own_window_transparent = true,
	own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
	own_window_argb_visual = true,
	own_window_argb_value = 51,

	double_buffer = true,
	maximum_width = 400,
	draw_shades = no,
	draw_outline = no,
	draw_borders = no,
	draw_graph_borders = true,

	default_color = gray,
	default_shade_color = red,
	default_outline_color = white,

	alignment = 'top_right',

	gap_x = 7,
	gap_y = 25,

	stippled_borders = 3,
	border_inner_margin = 4,
	border_width = 5,

	no_buffers = no,
	uppercase = no,
	cpu_avg_samples = 2,
	net_avg_samples = 1,
	override_utf8_locale = true,
	use_spacer = right,
	text_buffer_size = 256,

}

conky.text = [[
# System info
${font }${color #3b71a1}${color #3b71a1}Host ${nodename} ${color #3b71a1} ${hr 2}
$font${color DimGray}$sysname $kernel $alignr $machine
Date ${font }$alignr${time %F}
Time $alignr${time %H:%M:%S}
Uptime $alignr${uptime_short}
File System $alignr${fs_type}

# Network data
${font }${color #3b71a1}NETWORK ${color #3b71a1}${hr 2}
$font${color DimGray}IP on wlp6s0 $alignr ${addr wlp6s0}
$font${color DimGray}Up $alignr ${upspeed wlp6s0}
${color DimGray}${upspeedgraph wlp6s0 20,250 DimGray DimGray}
${color DimGray}Down $alignr ${downspeed wlp6s0}
${color DimGray}${downspeedgraph wlp6s0 20,250 DimGray DimGray}  
${color DimGray}Uploaded: $alignr ${totalup wlp6s0} Downloaded: $alignr ${totaldown wlp6s0}

# CPU Graph
${font }${color #3b71a1}PROCESSORS ${color #3b71a1}${hr 2}
$font${color DimGray}Core1 ${cpu cpu1}% ${cpubar cpu1}
Freq: ${freq 1}MHz
Core2 ${cpu cpu2}% ${cpubar cpu2}
Freq: ${freq 2}MHz
Core3 ${cpu cpu3}% ${cpubar cpu3}
Freq: ${freq 3}MHz
Core4 ${cpu cpu4}% ${cpubar cpu4}
Freq: ${freq 4}MHz
Core4 ${cpu cpu5}% ${cpubar cpu5}
Freq: ${freq 5}MHz
Core4 ${cpu cpu6}% ${cpubar cpu6}
Freq: ${freq 6}MHz
Core4 ${cpu cpu7}% ${cpubar cpu7}
Freq: ${freq 7}MHz
Core4 ${cpu cpu8}% ${cpubar cpu8}
Freq: ${freq 8}MHz

# Memory Graph
${font }${color #3b71a1}MEMORY ${color #3b71a1}${hr 2}
$font${color DimGray}MEM $alignc $mem / $memmax $alignr $memperc%
$membar
${font }${color #3b71a1}HDD ${color #3b71a1}${hr 2}
$font${color DimGray}/home $alignc ${fs_used /home} / ${fs_size /home} $alignr ${fs_free_perc /home}%
${fs_bar /home}

${color #3b71a1}Disk I/O: $color${diskio}
${color DimGray}Read:
${color DimGray}${diskiograph_read 20,250 DimGray DimGray 750}
${color DimGray}Write:
${color DimGray}${diskiograph_write 20,250 DimGray DimGray 750}

${color #3b71a1}Swap Usage:$color $swap${color DimGray}/${color}$swapmax - $swapperc% ${color DimGray}${swapbar}
${color #3b71a1}Entropy: ${color}${entropy_avail}${color DimGray}/${color}${entropy_poolsize} ${color DimGray}${entropy_bar}

# TOP 3 CPU-consumers
$font${color DimGray}CPU: ${alignr 45}PID ${alignr 15}CPU% ${alignr 1}MEM% ${font }
${color red}${top name 1}${alignr 50}${top pid 1}${alignr 30}${top cpu 1}${alignr 10}${top mem 1}
${color white}${top name 2}${alignr 50}${top pid 2}${alignr 30}${top cpu 2}${alignr 10}${top mem 2}
${color white}${top name 3}${alignr 50}${top pid 3}${alignr 30}${top cpu 3}${alignr 10}${top mem 3}

# Top 3 Memory-consumers
$font${color DimGray}Memory: ${alignr 45}PID ${alignr 15}CPU% ${alignr 1}MEM% ${font }
${color yellow}${top_mem name 1}${alignr 50}${top_mem pid 1}${alignr 30}${top_mem cpu 1}${alignr 10}${top_mem mem 1}
${color white}${top_mem name 2}${alignr 50}${top_mem pid 2}${alignr 30}${top_mem cpu 2}${alignr 10}${top_mem mem 2}
${color white}${top_mem name 3}${alignr 50}${top_mem pid 3}${alignr 30}${top_mem cpu 3}${alignr 10}${top_mem mem 3}

# Top 3 IO-consumers
$font${color DimGray}IO: ${alignr 60}PID ${alignr 30}MEM% ${alignr 1}IO% ${font }
${color #FF6E00}${top_io name 1}${alignr 50}${top_io pid 1}${alignr 30}${top_io mem 1}${alignr 10}${top_io io_perc 1}
${color white}${top_io name 2}${alignr 50}${top_io pid 2}${alignr 30}${top_io mem 2}${alignr 10}${top_io io_perc 2}
${color white}${top_io name 3}${alignr 50}${top_io pid 3}${alignr 30}${top_io mem 3}${alignr 10}${top_io io_perc 3}


${font }${color #3b71a1}PROCESSES ${color #3b71a1}${hr 2}
$font${color #3b71a1}Total: ${color}$alignr${processes}
$font${top_mem name 1}${alignr}${top mem 1} %
$font${top_mem name 2}${alignr}${top mem 2} %
$font${top_mem name 3}${alignr}${top mem 3} %
$font${top_mem name 4}${alignr}${top mem 4} %
$font${top_mem name 5}${alignr}${top mem 5} %
$font${top_mem name 6}${alignr}${top mem 6} %
]]



