
ø†
ğ†#version 300 es

layout(std140) uniform vs_uniforms
{
    mat4 view_proj;
} _637;

uniform mediump sampler2D font_effects;

out mediump vec2 var_texcoord0;
layout(location = 1) in mediump vec2 texcoord0;
out vec4 var_effect;
layout(location = 7) in vec4 effect;
layout(location = 3) in mediump vec4 face_color;
out mediump vec4 var_face_color;
out mediump vec4 var_outline_color;
layout(location = 4) in mediump vec4 outline_color;
out mediump vec4 var_shadow_color;
layout(location = 5) in mediump vec4 shadow_color;
out mediump vec4 var_sdf_params;
layout(location = 2) in mediump vec4 sdf_params;
layout(location = 6) in mediump vec3 layer_mask;
out vec2 var_decoration;
out mediump vec4 var_layer_mask;
layout(location = 0) in mediump vec4 position;

void main()
{
    var_texcoord0 = texcoord0;
    var_effect = effect;
    vec4 _526 = var_effect;
    vec4 _1917;
    vec4 _1918;
    do
    {
        if (_526.z >= 0.0)
        {
            _1918 = _526;
            _1917 = face_color;
            break;
        }
        vec4 _1890;
        do
        {
            float _710 = abs(_526.z);
            bool _711 = _710 < 0.5;
            if (_711)
            {
                _1890 = face_color;
                break;
            }
            vec4 _1889;
            do
            {
                if (_711)
                {
                    _1889 = vec4(1.0);
                    break;
                }
                mediump vec4 _824 = textureLod(font_effects, vec2(0.0), 0.0);
                vec4 hp_copy_824 = _824;
                float _1846;
                do
                {
                    vec4 _1025 = floor((hp_copy_824 * 255.0) + vec4(0.5));
                    float _1027 = _1025.w;
                    float _1031 = _1025.z;
                    float _1034 = mod(_1027, 128.0) * 2.0 + floor(_1031 * 0.0078125);
                    if (_1034 == 0.0)
                    {
                        _1846 = 0.0;
                        break;
                    }
                    float _1049 = _1025.x * 1.52587890625e-05 + (_1025.y * 0.00390625 + mod(_1031, 128.0));
                    float _1845;
                    if (_1027 < 128.0)
                    {
                        _1845 = _1049 * 0.0078125 + 1.0;
                    }
                    else
                    {
                        _1845 = (-_1049) * 0.0078125 + (-1.0);
                    }
                    _1846 = _1845 * exp2(_1034 - 127.0);
                    break;
                } while(false);
                vec2 _833 = vec2(0.03125, (floor(_710 + 0.5) + 0.5) * _1846);
                mediump vec4 _1077 = textureLod(font_effects, _833, 0.0);
                mediump float _837 = _1077.x;
                float hp_copy_837 = _837;
                float _840 = floor(hp_copy_837 * 255.0 + 0.5);
                mediump vec4 _1088 = textureLod(font_effects, _833 + vec2(0.0625, 0.0), 0.0);
                if (_840 < 0.5)
                {
                    _1889 = _1088;
                    break;
                }
                mediump vec4 _1099 = textureLod(font_effects, _833 + vec2(0.125, 0.0), 0.0);
                mediump vec4 _1110 = textureLod(font_effects, _833 + vec2(0.1875, 0.0), 0.0);
                mediump vec4 _1121 = textureLod(font_effects, _833 + vec2(0.25, 0.0), 0.0);
                if (_840 > 2.5)
                {
                    vec2 _1888;
                    if (_1077.z > 0.0)
                    {
                        _1888 = vec2(1.0 - abs(mod(_526.x + _526.w, 2.0) - 1.0), 1.0 - abs(mod(_526.y + _526.w, 2.0) - 1.0));
                    }
                    else
                    {
                        _1888 = _526.xy;
                    }
                    vec2 _880 = clamp(_1888, vec2(0.0), vec2(1.0));
                    vec4 _885 = vec4(_880.x);
                    _1889 = mix(mix(_1088, _1099, _885), mix(_1110, _1121, _885), vec4(_880.y));
                    break;
                }
                mediump vec4 _1146 = textureLod(font_effects, _833 + vec2(0.4375, 0.0), 0.0);
                vec4 hp_copy_1146 = _1146;
                float _1850;
                do
                {
                    vec4 _1161 = floor((hp_copy_1146 * 255.0) + vec4(0.5));
                    float _1163 = _1161.w;
                    float _1167 = _1161.z;
                    float _1170 = mod(_1163, 128.0) * 2.0 + floor(_1167 * 0.0078125);
                    if (_1170 == 0.0)
                    {
                        _1850 = 0.0;
                        break;
                    }
                    float _1185 = _1161.x * 1.52587890625e-05 + (_1161.y * 0.00390625 + mod(_1167, 128.0));
                    float _1849;
                    if (_1163 < 128.0)
                    {
                        _1849 = _1185 * 0.0078125 + 1.0;
                    }
                    else
                    {
                        _1849 = (-_1185) * 0.0078125 + (-1.0);
                    }
                    _1850 = _1849 * exp2(_1170 - 127.0);
                    break;
                } while(false);
                mediump vec4 _1213 = textureLod(font_effects, _833 + vec2(0.5, 0.0), 0.0);
                vec4 hp_copy_1213 = _1213;
                float _1852;
                do
                {
                    vec4 _1228 = floor((hp_copy_1213 * 255.0) + vec4(0.5));
                    float _1230 = _1228.w;
                    float _1234 = _1228.z;
                    float _1237 = mod(_1230, 128.0) * 2.0 + floor(_1234 * 0.0078125);
                    if (_1237 == 0.0)
                    {
                        _1852 = 0.0;
                        break;
                    }
                    float _1252 = _1228.x * 1.52587890625e-05 + (_1228.y * 0.00390625 + mod(_1234, 128.0));
                    float _1851;
                    if (_1230 < 128.0)
                    {
                        _1851 = _1252 * 0.0078125 + 1.0;
                    }
                    else
                    {
                        _1851 = (-_1252) * 0.0078125 + (-1.0);
                    }
                    _1852 = _1851 * exp2(_1237 - 127.0);
                    break;
                } while(false);
                vec2 _904 = vec2(_1850, _1852);
                float _1875;
                if (_840 < 1.5)
                {
                    mediump vec4 _1280 = textureLod(font_effects, _833 + vec2(0.5625, 0.0), 0.0);
                    vec4 hp_copy_1280 = _1280;
                    float _1874;
                    do
                    {
                        vec4 _1295 = floor((hp_copy_1280 * 255.0) + vec4(0.5));
                        float _1297 = _1295.w;
                        float _1301 = _1295.z;
                        float _1304 = mod(_1297, 128.0) * 2.0 + floor(_1301 * 0.0078125);
                        if (_1304 == 0.0)
                        {
                            _1874 = 0.0;
                            break;
                        }
                        float _1319 = _1295.x * 1.52587890625e-05 + (_1295.y * 0.00390625 + mod(_1301, 128.0));
                        float _1873;
                        if (_1297 < 128.0)
                        {
                            _1873 = _1319 * 0.0078125 + 1.0;
                        }
                        else
                        {
                            _1873 = (-_1319) * 0.0078125 + (-1.0);
                        }
                        _1874 = _1873 * exp2(_1304 - 127.0);
                        break;
                    } while(false);
                    _1875 = dot(_526.xy, _904) + _1874;
                }
                else
                {
                    mediump vec4 _1347 = textureLod(font_effects, _833 + vec2(0.5625, 0.0), 0.0);
                    vec4 hp_copy_1347 = _1347;
                    float _1854;
                    do
                    {
                        vec4 _1362 = floor((hp_copy_1347 * 255.0) + vec4(0.5));
                        float _1364 = _1362.w;
                        float _1368 = _1362.z;
                        float _1371 = mod(_1364, 128.0) * 2.0 + floor(_1368 * 0.0078125);
                        if (_1371 == 0.0)
                        {
                            _1854 = 0.0;
                            break;
                        }
                        float _1386 = _1362.x * 1.52587890625e-05 + (_1362.y * 0.00390625 + mod(_1368, 128.0));
                        float _1853;
                        if (_1364 < 128.0)
                        {
                            _1853 = _1386 * 0.0078125 + 1.0;
                        }
                        else
                        {
                            _1853 = (-_1386) * 0.0078125 + (-1.0);
                        }
                        _1854 = _1853 * exp2(_1371 - 127.0);
                        break;
                    } while(false);
                    mediump vec4 _1414 = textureLod(font_effects, _833 + vec2(0.625, 0.0), 0.0);
                    vec4 hp_copy_1414 = _1414;
                    float _1856;
                    do
                    {
                        vec4 _1429 = floor((hp_copy_1414 * 255.0) + vec4(0.5));
                        float _1431 = _1429.w;
                        float _1435 = _1429.z;
                        float _1438 = mod(_1431, 128.0) * 2.0 + floor(_1435 * 0.0078125);
                        if (_1438 == 0.0)
                        {
                            _1856 = 0.0;
                            break;
                        }
                        float _1453 = _1429.x * 1.52587890625e-05 + (_1429.y * 0.00390625 + mod(_1435, 128.0));
                        float _1855;
                        if (_1431 < 128.0)
                        {
                            _1855 = _1453 * 0.0078125 + 1.0;
                        }
                        else
                        {
                            _1855 = (-_1453) * 0.0078125 + (-1.0);
                        }
                        _1856 = _1855 * exp2(_1438 - 127.0);
                        break;
                    } while(false);
                    mediump vec4 _1481 = textureLod(font_effects, _833 + vec2(0.6875, 0.0), 0.0);
                    vec4 hp_copy_1481 = _1481;
                    float _1858;
                    do
                    {
                        vec4 _1496 = floor((hp_copy_1481 * 255.0) + vec4(0.5));
                        float _1498 = _1496.w;
                        float _1502 = _1496.z;
                        float _1505 = mod(_1498, 128.0) * 2.0 + floor(_1502 * 0.0078125);
                        if (_1505 == 0.0)
                        {
                            _1858 = 0.0;
                            break;
                        }
                        float _1520 = _1496.x * 1.52587890625e-05 + (_1496.y * 0.00390625 + mod(_1502, 128.0));
                        float _1857;
                        if (_1498 < 128.0)
                        {
                            _1857 = _1520 * 0.0078125 + 1.0;
                        }
                        else
                        {
                            _1857 = (-_1520) * 0.0078125 + (-1.0);
                        }
                        _1858 = _1857 * exp2(_1505 - 127.0);
                        break;
                    } while(false);
                    mediump vec4 _1548 = textureLod(font_effects, _833 + vec2(0.75, 0.0), 0.0);
                    vec4 hp_copy_1548 = _1548;
                    float _1860;
                    do
                    {
                        vec4 _1563 = floor((hp_copy_1548 * 255.0) + vec4(0.5));
                        float _1565 = _1563.w;
                        float _1569 = _1563.z;
                        float _1572 = mod(_1565, 128.0) * 2.0 + floor(_1569 * 0.0078125);
                        if (_1572 == 0.0)
                        {
                            _1860 = 0.0;
                            break;
                        }
                        float _1587 = _1563.x * 1.52587890625e-05 + (_1563.y * 0.00390625 + mod(_1569, 128.0));
                        float _1859;
                        if (_1565 < 128.0)
                        {
                            _1859 = _1587 * 0.0078125 + 1.0;
                        }
                        else
                        {
                            _1859 = (-_1587) * 0.0078125 + (-1.0);
                        }
                        _1860 = _1859 * exp2(_1572 - 127.0);
                        break;
                    } while(false);
                    vec2 _934 = _526.xy - _904;
                    _1875 = length(_934 * vec2(_1854, _1856) + (_934.yx * vec2(_1858, _1860)));
                }
                float _1879;
                if (_1077.z > 0.0)
                {
                    _1879 = 1.0 - abs(mod(_1875 + _526.w, 2.0) - 1.0);
                }
                else
                {
                    _1879 = clamp(_1875, 0.0, 1.0);
                }
                mediump vec4 _1622 = textureLod(font_effects, _833 + vec2(0.3125, 0.0), 0.0);
                mediump vec4 _1633 = textureLod(font_effects, _833 + vec2(0.375, 0.0), 0.0);
                mediump float _1641 = _1622.y;
                float hp_copy_1641 = _1641;
                float _1643 = _1622.x * 0.996108949184417724609375 + (hp_copy_1641 * 0.00389105058275163173675537109375);
                mediump float _1650 = _1622.w;
                float hp_copy_1650 = _1650;
                float _1652 = _1622.z * 0.996108949184417724609375 + (hp_copy_1650 * 0.00389105058275163173675537109375);
                mediump float _1659 = _1633.y;
                float hp_copy_1659 = _1659;
                float _1661 = _1633.x * 0.996108949184417724609375 + (hp_copy_1659 * 0.00389105058275163173675537109375);
                mediump float _1668 = _1633.w;
                float hp_copy_1668 = _1668;
                float _1670 = _1633.z * 0.996108949184417724609375 + (hp_copy_1668 * 0.00389105058275163173675537109375);
                float _1880;
                do
                {
                    if (_1652 <= _1643)
                    {
                        _1880 = step(_1652, _1879);
                        break;
                    }
                    _1880 = clamp((_1879 - _1643) / (_1652 - _1643), 0.0, 1.0);
                    break;
                } while(false);
                vec4 _1887;
                if (_1879 >= _1652)
                {
                    float _1882;
                    do
                    {
                        if (_1661 <= _1652)
                        {
                            _1882 = step(_1661, _1879);
                            break;
                        }
                        _1882 = clamp((_1879 - _1652) / (_1661 - _1652), 0.0, 1.0);
                        break;
                    } while(false);
                    _1887 = mix(_1099, _1110, vec4(_1882));
                }
                else
                {
                    _1887 = mix(_1088, _1099, vec4(_1880));
                }
                vec4 _1886;
                if (_1879 >= _1661)
                {
                    float _1885;
                    do
                    {
                        if (_1670 <= _1661)
                        {
                            _1885 = step(_1670, _1879);
                            break;
                        }
                        _1885 = clamp((_1879 - _1661) / (_1670 - _1661), 0.0, 1.0);
                        break;
                    } while(false);
                    _1886 = mix(_1110, _1121, vec4(_1885));
                }
                else
                {
                    _1886 = _1887;
                }
                _1889 = _1886;
                break;
            } while(false);
            _1890 = vec4(_1889.xyz * 1.0, min(face_color.w, _1889.w));
            break;
        } while(false);
        _526.z = 0.0;
        _1918 = _526;
        _1917 = _1890;
        break;
    } while(false);
    var_effect = _1918;
    var_face_color = vec4(_1917.xyz * _1917.w, _1917.w);
    var_outline_color = vec4(outline_color.xyz * outline_color.w, outline_color.w);
    var_shadow_color = vec4(shadow_color.xyz * shadow_color.w, shadow_color.w);
    var_sdf_params = sdf_params;
    bool _578 = layer_mask.z < 0.0;
    mediump vec2 _1919;
    if (_578)
    {
        _1919 = vec2(layer_mask.y, -layer_mask.z);
    }
    else
    {
        _1919 = vec2(0.0);
    }
    var_decoration = _1919;
    mediump float _596 = step(1.5, layer_mask.x);
    mediump float _603 = step(2.5, layer_mask.x);
    mediump vec3 _609 = vec3(1.0 - _596, _596 * (1.0 - _603), _603);
    bvec3 _615 = bvec3(_578);
    vec3 _616 = vec3(_615.x ? _609.x : layer_mask.x, _615.y ? _609.y : layer_mask.y, _615.z ? _609.z : layer_mask.z);
    var_layer_mask.x = _616.x;
    var_layer_mask.y = _616.y;
    var_layer_mask.z = _616.z;
    var_layer_mask.w = (var_layer_mask.x * var_layer_mask.y) * var_layer_mask.z;
    gl_Position = _637.view_proj * vec4(position.x, position.y, position.z, 1.0);
}

 
«z
¤z#version 300 es
precision mediump float;
precision highp int;

uniform mediump sampler2D font_effects;
uniform mediump sampler2D texture_sampler;

in highp vec2 var_decoration;
in highp vec4 var_effect;
in vec4 var_face_color;
in vec2 var_texcoord0;
in vec4 var_sdf_params;
in vec4 var_layer_mask;
layout(location = 0) out highp vec4 out_fragColor;
in vec4 var_outline_color;
in vec4 var_shadow_color;

void main()
{
    highp vec4 _1867;
    do
    {
        highp float _673 = abs(var_effect.z);
        bool _674 = _673 < 0.5;
        if (_674)
        {
            _1867 = var_face_color;
            break;
        }
        highp vec4 _1866;
        do
        {
            if (_674)
            {
                _1866 = vec4(1.0);
                break;
            }
            vec4 _787 = texture(font_effects, vec2(0.0));
            highp vec4 hp_copy_787 = _787;
            highp float _1823;
            do
            {
                highp vec4 _988 = floor((hp_copy_787 * 255.0) + vec4(0.5));
                highp float _990 = _988.w;
                highp float _994 = _988.z;
                highp float _997 = mod(_990, 128.0) * 2.0 + floor(_994 * 0.0078125);
                if (_997 == 0.0)
                {
                    _1823 = 0.0;
                    break;
                }
                highp float _1012 = _988.x * 1.52587890625e-05 + (_988.y * 0.00390625 + mod(_994, 128.0));
                highp float _1822;
                if (_990 < 128.0)
                {
                    _1822 = _1012 * 0.0078125 + 1.0;
                }
                else
                {
                    _1822 = (-_1012) * 0.0078125 + (-1.0);
                }
                _1823 = _1822 * exp2(_997 - 127.0);
                break;
            } while(false);
            highp vec2 _796 = vec2(0.03125, (floor(_673 + 0.5) + 0.5) * _1823);
            vec4 _1040 = texture(font_effects, _796);
            float _800 = _1040.x;
            highp float hp_copy_800 = _800;
            highp float _803 = floor(hp_copy_800 * 255.0 + 0.5);
            vec4 _1051 = texture(font_effects, _796 + vec2(0.0625, 0.0));
            if (_803 < 0.5)
            {
                _1866 = _1051;
                break;
            }
            vec4 _1062 = texture(font_effects, _796 + vec2(0.125, 0.0));
            vec4 _1073 = texture(font_effects, _796 + vec2(0.1875, 0.0));
            vec4 _1084 = texture(font_effects, _796 + vec2(0.25, 0.0));
            if (_803 > 2.5)
            {
                highp vec2 _1865;
                if (_1040.z > 0.0)
                {
                    _1865 = vec2(1.0 - abs(mod(var_effect.x + var_effect.w, 2.0) - 1.0), 1.0 - abs(mod(var_effect.y + var_effect.w, 2.0) - 1.0));
                }
                else
                {
                    _1865 = var_effect.xy;
                }
                highp vec2 _843 = clamp(_1865, vec2(0.0), vec2(1.0));
                highp vec4 _848 = vec4(_843.x);
                _1866 = mix(mix(_1051, _1062, _848), mix(_1073, _1084, _848), vec4(_843.y));
                break;
            }
            vec4 _1109 = texture(font_effects, _796 + vec2(0.4375, 0.0));
            highp vec4 hp_copy_1109 = _1109;
            highp float _1827;
            do
            {
                highp vec4 _1124 = floor((hp_copy_1109 * 255.0) + vec4(0.5));
                highp float _1126 = _1124.w;
                highp float _1130 = _1124.z;
                highp float _1133 = mod(_1126, 128.0) * 2.0 + floor(_1130 * 0.0078125);
                if (_1133 == 0.0)
                {
                    _1827 = 0.0;
                    break;
                }
                highp float _1148 = _1124.x * 1.52587890625e-05 + (_1124.y * 0.00390625 + mod(_1130, 128.0));
                highp float _1826;
                if (_1126 < 128.0)
                {
                    _1826 = _1148 * 0.0078125 + 1.0;
                }
                else
                {
                    _1826 = (-_1148) * 0.0078125 + (-1.0);
                }
                _1827 = _1826 * exp2(_1133 - 127.0);
                break;
            } while(false);
            vec4 _1176 = texture(font_effects, _796 + vec2(0.5, 0.0));
            highp vec4 hp_copy_1176 = _1176;
            highp float _1829;
            do
            {
                highp vec4 _1191 = floor((hp_copy_1176 * 255.0) + vec4(0.5));
                highp float _1193 = _1191.w;
                highp float _1197 = _1191.z;
                highp float _1200 = mod(_1193, 128.0) * 2.0 + floor(_1197 * 0.0078125);
                if (_1200 == 0.0)
                {
                    _1829 = 0.0;
                    break;
                }
                highp float _1215 = _1191.x * 1.52587890625e-05 + (_1191.y * 0.00390625 + mod(_1197, 128.0));
                highp float _1828;
                if (_1193 < 128.0)
                {
                    _1828 = _1215 * 0.0078125 + 1.0;
                }
                else
                {
                    _1828 = (-_1215) * 0.0078125 + (-1.0);
                }
                _1829 = _1828 * exp2(_1200 - 127.0);
                break;
            } while(false);
            highp vec2 _867 = vec2(_1827, _1829);
            highp float _1852;
            if (_803 < 1.5)
            {
                vec4 _1243 = texture(font_effects, _796 + vec2(0.5625, 0.0));
                highp vec4 hp_copy_1243 = _1243;
                highp float _1851;
                do
                {
                    highp vec4 _1258 = floor((hp_copy_1243 * 255.0) + vec4(0.5));
                    highp float _1260 = _1258.w;
                    highp float _1264 = _1258.z;
                    highp float _1267 = mod(_1260, 128.0) * 2.0 + floor(_1264 * 0.0078125);
                    if (_1267 == 0.0)
                    {
                        _1851 = 0.0;
                        break;
                    }
                    highp float _1282 = _1258.x * 1.52587890625e-05 + (_1258.y * 0.00390625 + mod(_1264, 128.0));
                    highp float _1850;
                    if (_1260 < 128.0)
                    {
                        _1850 = _1282 * 0.0078125 + 1.0;
                    }
                    else
                    {
                        _1850 = (-_1282) * 0.0078125 + (-1.0);
                    }
                    _1851 = _1850 * exp2(_1267 - 127.0);
                    break;
                } while(false);
                _1852 = dot(var_effect.xy, _867) + _1851;
            }
            else
            {
                vec4 _1310 = texture(font_effects, _796 + vec2(0.5625, 0.0));
                highp vec4 hp_copy_1310 = _1310;
                highp float _1831;
                do
                {
                    highp vec4 _1325 = floor((hp_copy_1310 * 255.0) + vec4(0.5));
                    highp float _1327 = _1325.w;
                    highp float _1331 = _1325.z;
                    highp float _1334 = mod(_1327, 128.0) * 2.0 + floor(_1331 * 0.0078125);
                    if (_1334 == 0.0)
                    {
                        _1831 = 0.0;
                        break;
                    }
                    highp float _1349 = _1325.x * 1.52587890625e-05 + (_1325.y * 0.00390625 + mod(_1331, 128.0));
                    highp float _1830;
                    if (_1327 < 128.0)
                    {
                        _1830 = _1349 * 0.0078125 + 1.0;
                    }
                    else
                    {
                        _1830 = (-_1349) * 0.0078125 + (-1.0);
                    }
                    _1831 = _1830 * exp2(_1334 - 127.0);
                    break;
                } while(false);
                vec4 _1377 = texture(font_effects, _796 + vec2(0.625, 0.0));
                highp vec4 hp_copy_1377 = _1377;
                highp float _1833;
                do
                {
                    highp vec4 _1392 = floor((hp_copy_1377 * 255.0) + vec4(0.5));
                    highp float _1394 = _1392.w;
                    highp float _1398 = _1392.z;
                    highp float _1401 = mod(_1394, 128.0) * 2.0 + floor(_1398 * 0.0078125);
                    if (_1401 == 0.0)
                    {
                        _1833 = 0.0;
                        break;
                    }
                    highp float _1416 = _1392.x * 1.52587890625e-05 + (_1392.y * 0.00390625 + mod(_1398, 128.0));
                    highp float _1832;
                    if (_1394 < 128.0)
                    {
                        _1832 = _1416 * 0.0078125 + 1.0;
                    }
                    else
                    {
                        _1832 = (-_1416) * 0.0078125 + (-1.0);
                    }
                    _1833 = _1832 * exp2(_1401 - 127.0);
                    break;
                } while(false);
                vec4 _1444 = texture(font_effects, _796 + vec2(0.6875, 0.0));
                highp vec4 hp_copy_1444 = _1444;
                highp float _1835;
                do
                {
                    highp vec4 _1459 = floor((hp_copy_1444 * 255.0) + vec4(0.5));
                    highp float _1461 = _1459.w;
                    highp float _1465 = _1459.z;
                    highp float _1468 = mod(_1461, 128.0) * 2.0 + floor(_1465 * 0.0078125);
                    if (_1468 == 0.0)
                    {
                        _1835 = 0.0;
                        break;
                    }
                    highp float _1483 = _1459.x * 1.52587890625e-05 + (_1459.y * 0.00390625 + mod(_1465, 128.0));
                    highp float _1834;
                    if (_1461 < 128.0)
                    {
                        _1834 = _1483 * 0.0078125 + 1.0;
                    }
                    else
                    {
                        _1834 = (-_1483) * 0.0078125 + (-1.0);
                    }
                    _1835 = _1834 * exp2(_1468 - 127.0);
                    break;
                } while(false);
                vec4 _1511 = texture(font_effects, _796 + vec2(0.75, 0.0));
                highp vec4 hp_copy_1511 = _1511;
                highp float _1837;
                do
                {
                    highp vec4 _1526 = floor((hp_copy_1511 * 255.0) + vec4(0.5));
                    highp float _1528 = _1526.w;
                    highp float _1532 = _1526.z;
                    highp float _1535 = mod(_1528, 128.0) * 2.0 + floor(_1532 * 0.0078125);
                    if (_1535 == 0.0)
                    {
                        _1837 = 0.0;
                        break;
                    }
                    highp float _1550 = _1526.x * 1.52587890625e-05 + (_1526.y * 0.00390625 + mod(_1532, 128.0));
                    highp float _1836;
                    if (_1528 < 128.0)
                    {
                        _1836 = _1550 * 0.0078125 + 1.0;
                    }
                    else
                    {
                        _1836 = (-_1550) * 0.0078125 + (-1.0);
                    }
                    _1837 = _1836 * exp2(_1535 - 127.0);
                    break;
                } while(false);
                highp vec2 _897 = var_effect.xy - _867;
                _1852 = length(_897 * vec2(_1831, _1833) + (_897.yx * vec2(_1835, _1837)));
            }
            highp float _1856;
            if (_1040.z > 0.0)
            {
                _1856 = 1.0 - abs(mod(_1852 + var_effect.w, 2.0) - 1.0);
            }
            else
            {
                _1856 = clamp(_1852, 0.0, 1.0);
            }
            vec4 _1585 = texture(font_effects, _796 + vec2(0.3125, 0.0));
            vec4 _1596 = texture(font_effects, _796 + vec2(0.375, 0.0));
            float _1604 = _1585.y;
            highp float hp_copy_1604 = _1604;
            highp float _1606 = _1585.x * 0.996108949184417724609375 + (hp_copy_1604 * 0.00389105058275163173675537109375);
            float _1613 = _1585.w;
            highp float hp_copy_1613 = _1613;
            highp float _1615 = _1585.z * 0.996108949184417724609375 + (hp_copy_1613 * 0.00389105058275163173675537109375);
            float _1622 = _1596.y;
            highp float hp_copy_1622 = _1622;
            highp float _1624 = _1596.x * 0.996108949184417724609375 + (hp_copy_1622 * 0.00389105058275163173675537109375);
            float _1631 = _1596.w;
            highp float hp_copy_1631 = _1631;
            highp float _1633 = _1596.z * 0.996108949184417724609375 + (hp_copy_1631 * 0.00389105058275163173675537109375);
            highp float _1857;
            do
            {
                if (_1615 <= _1606)
                {
                    _1857 = step(_1615, _1856);
                    break;
                }
                _1857 = clamp((_1856 - _1606) / (_1615 - _1606), 0.0, 1.0);
                break;
            } while(false);
            highp vec4 _1864;
            if (_1856 >= _1615)
            {
                highp float _1859;
                do
                {
                    if (_1624 <= _1615)
                    {
                        _1859 = step(_1624, _1856);
                        break;
                    }
                    _1859 = clamp((_1856 - _1615) / (_1624 - _1615), 0.0, 1.0);
                    break;
                } while(false);
                _1864 = mix(_1062, _1073, vec4(_1859));
            }
            else
            {
                _1864 = mix(_1051, _1062, vec4(_1857));
            }
            highp vec4 _1863;
            if (_1856 >= _1624)
            {
                highp float _1862;
                do
                {
                    if (_1633 <= _1624)
                    {
                        _1862 = step(_1633, _1856);
                        break;
                    }
                    _1862 = clamp((_1856 - _1624) / (_1633 - _1624), 0.0, 1.0);
                    break;
                } while(false);
                _1863 = mix(_1073, _1084, vec4(_1862));
            }
            else
            {
                _1863 = _1864;
            }
            _1866 = _1863;
            break;
        } while(false);
        highp float _684 = min(var_face_color.w, _1866.w);
        _1867 = vec4(_1866.xyz * _684, _684);
        break;
    } while(false);
    vec4 _528 = texture(texture_sampler, var_texcoord0);
    float _531 = _528.x;
    float _551 = step(1.25, var_sdf_params.w);
    float _561 = mix(var_sdf_params.w, (var_sdf_params.w - 1.5) * 2.0, _551);
    float _578 = var_sdf_params.x + var_sdf_params.z;
    float _580 = smoothstep(var_sdf_params.x - var_sdf_params.z, _578, _531);
    highp float hp_copy_580 = _580;
    float _589 = smoothstep(var_sdf_params.y - var_sdf_params.z, var_sdf_params.y + var_sdf_params.z, _531);
    highp float _1878 = -hp_copy_580;
    float mp_copy_1878 = _1878;
    float _634 = min(1.0, _589 + _580);
    highp float hp_copy_634 = _634;
    highp float _1879 = -hp_copy_634;
    float mp_copy_1879 = _1879;
    highp float _1868;
    if (var_decoration.y > 0.0)
    {
        _1868 = 1.0 - step(var_decoration.y, fract(var_decoration.x));
    }
    else
    {
        _1868 = 1.0;
    }
    out_fragColor = ((((_1867 * _580) * var_layer_mask.x) + (((var_outline_color * _589) * var_layer_mask.y) * (mp_copy_1878 * var_layer_mask.w + 1.0))) + (((var_shadow_color * mix(smoothstep(_561 - var_sdf_params.z, _578, mix(_528.z, _531, _551)), _589, floor(_561) * (1.0 - _551))) * var_layer_mask.z) * (mp_copy_1879 * var_layer_mask.w + 1.0))) * _1868;
}

ô
0
vs_uniformsóù–ïéÁğß#  ı* 0 8 @HPX@hD
font_effectsŒ¡ëğØ¬ÒæÓ
  7*font_effects0Œ¡ëğØ¬ÒæÓ8 @ HPhI
texture_samplerë¦Åà·í
  Œ*texture_sampler0ë¦Åà·í8@HPh"=
positionÆ«ô©ˆ£Ä­â  ƒ*position0Æ«ô©ˆ£Ä­â8 @ HPh"?
	texcoord0ÙÕôÚÛœ¦ûÀ  „*	texcoord00ÙÕôÚÛœ¦ûÀ8 @HPh"?

sdf_paramsşä™ÄÓÏÄ²b  »*
sdf_params0şä™ÄÓÏÄ²b8 @HPh"?

face_colorÏ›ÁÈäïµ  Œ*
face_color0Ï›ÁÈäïµ8 @HPh"E
outline_colorûîÊ×Í›²E   *outline_color0ûîÊ×Í›²E8 @HPh"E
shadow_color«­ñŠ¥¨Ï¸ö  ®*shadow_color0«­ñŠ¥¨Ï¸ö8 @HPh"A

layer_mask³½Ã‡Øª®â•  ¿*
layer_mask0³½Ã‡Øª®â•8 @HPh"9
effect¡ã†Ó‚ÖÃÀ…  ‰*effect0¡ã†Ó‚ÖÃÀ…8 @HPh"A

var_effect´Û–ÚŠÚ¨Ö  ‚*
var_effect0´Û–ÚŠÚ¨Ö8 @ HPh"E
var_texcoord0ñÑñ¢ÖÀ˜ã  *var_texcoord00ñÑñ¢ÖÀ˜ã8 @HPh"I
var_face_colorà»«ğº™«õ‚  ƒ*var_face_color0à»«ğº™«õ‚8 @HPh"M
var_outline_colorÒÿ‹Ï²Øå¨X  ä*var_outline_color0Òÿ‹Ï²Øå¨X8 @HPh"K
var_shadow_colorÖŞãşáıº°F  ñ*var_shadow_color0ÖŞãşáıº°F8 @HPh"I
var_sdf_paramsÊçıñ¯¢Æá  ˜*var_sdf_params0Êçıñ¯¢Æá8 @HPh"I
var_layer_maskúÚ¤¸Ê¼ÚàÊ  ¹*var_layer_mask0úÚ¤¸Ê¼ÚàÊ8 @HPh"G
var_decorationõÙ¢ß´Í  í*var_decoration0õÙ¢ß´Í8 @HPh*A

var_effect´Û–ÚŠÚ¨Ö  ‡*
var_effect0´Û–ÚŠÚ¨Ö8 @ HPh*E
var_texcoord0ñÑñ¢ÖÀ˜ã  ‚*var_texcoord00ñÑñ¢ÖÀ˜ã8 @HPh*I
var_face_colorà»«ğº™«õ‚  “*var_face_color0à»«ğº™«õ‚8 @HPh*M
var_outline_colorÒÿ‹Ï²Øå¨X  Ÿ*var_outline_color0Òÿ‹Ï²Øå¨X8 @HPh*K
var_shadow_colorÖŞãşáıº°F  ­*var_shadow_color0ÖŞãşáıº°F8 @HPh*I
var_sdf_paramsÊçıñ¯¢Æá  º*var_sdf_params0Êçıñ¯¢Æá8 @HPh*I
var_layer_maskúÚ¤¸Ê¼ÚàÊ  â*var_layer_mask0úÚ¤¸Ê¼ÚàÊ8 @HPh*G
var_decorationõÙ¢ß´Í  Ã*var_decoration0õÙ¢ß´Í8 @HPh*G
out_fragColor„‚ù¡‡ñ»ªç  Ü*out_fragColor0„‚ù¡‡ñ»ªç8 @ HPh28
vs_uniformsóù–ïéÁğß#
	view_projúì‡×Ì¤ë	  ( "/builtins/fonts/font-df.vp*/builtins/fonts/font-df.fp