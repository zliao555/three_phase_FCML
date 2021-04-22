module LUT(angle,sin,cos);
input [9:0] angle;
output signed [9:0] sin;
output signed [9:0] cos;
reg signed [9:0] sin;
reg signed [9:0] cos;
always@(angle)
case(angle)
10'd0:
 begin
 sin = 10'd0;
 cos = 10'd122;
 end
10'd1:
 begin
 sin = 10'd3;
 cos = 10'd121;
 end
10'd2:
 begin
 sin = 10'd6;
 cos = 10'd121;
 end
10'd3:
 begin
 sin = 10'd9;
 cos = 10'd121;
 end
10'd4:
 begin
 sin = 10'd12;
 cos = 10'd121;
 end
10'd5:
 begin
 sin = 10'd15;
 cos = 10'd121;
 end
10'd6:
 begin
 sin = 10'd18;
 cos = 10'd120;
 end
10'd7:
 begin
 sin = 10'd21;
 cos = 10'd120;
 end
10'd8:
 begin
 sin = 10'd24;
 cos = 10'd119;
 end
10'd9:
 begin
 sin = 10'd27;
 cos = 10'd119;
 end
10'd10:
 begin
 sin = 10'd30;
 cos = 10'd118;
 end
10'd11:
 begin
 sin = 10'd32;
 cos = 10'd117;
 end
10'd12:
 begin
 sin = 10'd35;
 cos = 10'd116;
 end
10'd13:
 begin
 sin = 10'd38;
 cos = 10'd115;
 end
10'd14:
 begin
 sin = 10'd41;
 cos = 10'd114;
 end
10'd15:
 begin
 sin = 10'd44;
 cos = 10'd113;
 end
10'd16:
 begin
 sin = 10'd47;
 cos = 10'd112;
 end
10'd17:
 begin
 sin = 10'd49;
 cos = 10'd111;
 end
10'd18:
 begin
 sin = 10'd52;
 cos = 10'd110;
 end
10'd19:
 begin
 sin = 10'd55;
 cos = 10'd109;
 end
10'd20:
 begin
 sin = 10'd57;
 cos = 10'd107;
 end
10'd21:
 begin
 sin = 10'd60;
 cos = 10'd106;
 end
10'd22:
 begin
 sin = 10'd63;
 cos = 10'd104;
 end
10'd23:
 begin
 sin = 10'd65;
 cos = 10'd103;
 end
10'd24:
 begin
 sin = 10'd68;
 cos = 10'd101;
 end
10'd25:
 begin
 sin = 10'd70;
 cos = 10'd99;
 end
10'd26:
 begin
 sin = 10'd72;
 cos = 10'd98;
 end
10'd27:
 begin
 sin = 10'd75;
 cos = 10'd96;
 end
10'd28:
 begin
 sin = 10'd77;
 cos = 10'd94;
 end
10'd29:
 begin
 sin = 10'd79;
 cos = 10'd92;
 end
10'd30:
 begin
 sin = 10'd82;
 cos = 10'd90;
 end
10'd31:
 begin
 sin = 10'd84;
 cos = 10'd88;
 end
10'd32:
 begin
 sin = 10'd86;
 cos = 10'd86;
 end
10'd33:
 begin
 sin = 10'd88;
 cos = 10'd84;
 end
10'd34:
 begin
 sin = 10'd90;
 cos = 10'd82;
 end
10'd35:
 begin
 sin = 10'd92;
 cos = 10'd79;
 end
10'd36:
 begin
 sin = 10'd94;
 cos = 10'd77;
 end
10'd37:
 begin
 sin = 10'd96;
 cos = 10'd75;
 end
10'd38:
 begin
 sin = 10'd98;
 cos = 10'd72;
 end
10'd39:
 begin
 sin = 10'd99;
 cos = 10'd70;
 end
10'd40:
 begin
 sin = 10'd101;
 cos = 10'd67;
 end
10'd41:
 begin
 sin = 10'd103;
 cos = 10'd65;
 end
10'd42:
 begin
 sin = 10'd104;
 cos = 10'd62;
 end
10'd43:
 begin
 sin = 10'd106;
 cos = 10'd60;
 end
10'd44:
 begin
 sin = 10'd107;
 cos = 10'd57;
 end
10'd45:
 begin
 sin = 10'd109;
 cos = 10'd55;
 end
10'd46:
 begin
 sin = 10'd110;
 cos = 10'd52;
 end
10'd47:
 begin
 sin = 10'd111;
 cos = 10'd49;
 end
10'd48:
 begin
 sin = 10'd112;
 cos = 10'd46;
 end
10'd49:
 begin
 sin = 10'd113;
 cos = 10'd44;
 end
10'd50:
 begin
 sin = 10'd114;
 cos = 10'd41;
 end
10'd51:
 begin
 sin = 10'd115;
 cos = 10'd38;
 end
10'd52:
 begin
 sin = 10'd116;
 cos = 10'd35;
 end
10'd53:
 begin
 sin = 10'd117;
 cos = 10'd32;
 end
10'd54:
 begin
 sin = 10'd118;
 cos = 10'd29;
 end
10'd55:
 begin
 sin = 10'd119;
 cos = 10'd26;
 end
10'd56:
 begin
 sin = 10'd119;
 cos = 10'd24;
 end
10'd57:
 begin
 sin = 10'd120;
 cos = 10'd21;
 end
10'd58:
 begin
 sin = 10'd120;
 cos = 10'd18;
 end
10'd59:
 begin
 sin = 10'd121;
 cos = 10'd15;
 end
10'd60:
 begin
 sin = 10'd121;
 cos = 10'd12;
 end
10'd61:
 begin
 sin = 10'd121;
 cos = 10'd9;
 end
10'd62:
 begin
 sin = 10'd121;
 cos = 10'd6;
 end
10'd63:
 begin
 sin = 10'd121;
 cos = 10'd3;
 end
10'd64:
 begin
 sin = 10'd121;
 cos = -10'd0;
 end
10'd65:
 begin
 sin = 10'd121;
 cos = -10'd3;
 end
10'd66:
 begin
 sin = 10'd121;
 cos = -10'd6;
 end
10'd67:
 begin
 sin = 10'd121;
 cos = -10'd9;
 end
10'd68:
 begin
 sin = 10'd121;
 cos = -10'd12;
 end
10'd69:
 begin
 sin = 10'd121;
 cos = -10'd15;
 end
10'd70:
 begin
 sin = 10'd120;
 cos = -10'd18;
 end
10'd71:
 begin
 sin = 10'd120;
 cos = -10'd21;
 end
10'd72:
 begin
 sin = 10'd119;
 cos = -10'd24;
 end
10'd73:
 begin
 sin = 10'd119;
 cos = -10'd27;
 end
10'd74:
 begin
 sin = 10'd118;
 cos = -10'd30;
 end
10'd75:
 begin
 sin = 10'd117;
 cos = -10'd33;
 end
10'd76:
 begin
 sin = 10'd116;
 cos = -10'd35;
 end
10'd77:
 begin
 sin = 10'd115;
 cos = -10'd38;
 end
10'd78:
 begin
 sin = 10'd114;
 cos = -10'd41;
 end
10'd79:
 begin
 sin = 10'd113;
 cos = -10'd44;
 end
10'd80:
 begin
 sin = 10'd112;
 cos = -10'd47;
 end
10'd81:
 begin
 sin = 10'd111;
 cos = -10'd49;
 end
10'd82:
 begin
 sin = 10'd110;
 cos = -10'd52;
 end
10'd83:
 begin
 sin = 10'd108;
 cos = -10'd55;
 end
10'd84:
 begin
 sin = 10'd107;
 cos = -10'd57;
 end
10'd85:
 begin
 sin = 10'd106;
 cos = -10'd60;
 end
10'd86:
 begin
 sin = 10'd104;
 cos = -10'd63;
 end
10'd87:
 begin
 sin = 10'd103;
 cos = -10'd65;
 end
10'd88:
 begin
 sin = 10'd101;
 cos = -10'd68;
 end
10'd89:
 begin
 sin = 10'd99;
 cos = -10'd70;
 end
10'd90:
 begin
 sin = 10'd97;
 cos = -10'd73;
 end
10'd91:
 begin
 sin = 10'd96;
 cos = -10'd75;
 end
10'd92:
 begin
 sin = 10'd94;
 cos = -10'd77;
 end
10'd93:
 begin
 sin = 10'd92;
 cos = -10'd80;
 end
10'd94:
 begin
 sin = 10'd90;
 cos = -10'd82;
 end
10'd95:
 begin
 sin = 10'd88;
 cos = -10'd84;
 end
10'd96:
 begin
 sin = 10'd86;
 cos = -10'd86;
 end
10'd97:
 begin
 sin = 10'd84;
 cos = -10'd88;
 end
10'd98:
 begin
 sin = 10'd81;
 cos = -10'd90;
 end
10'd99:
 begin
 sin = 10'd79;
 cos = -10'd92;
 end
10'd100:
 begin
 sin = 10'd77;
 cos = -10'd94;
 end
10'd101:
 begin
 sin = 10'd75;
 cos = -10'd96;
 end
10'd102:
 begin
 sin = 10'd72;
 cos = -10'd98;
 end
10'd103:
 begin
 sin = 10'd70;
 cos = -10'd100;
 end
10'd104:
 begin
 sin = 10'd67;
 cos = -10'd101;
 end
10'd105:
 begin
 sin = 10'd65;
 cos = -10'd103;
 end
10'd106:
 begin
 sin = 10'd62;
 cos = -10'd104;
 end
10'd107:
 begin
 sin = 10'd60;
 cos = -10'd106;
 end
10'd108:
 begin
 sin = 10'd57;
 cos = -10'd107;
 end
10'd109:
 begin
 sin = 10'd54;
 cos = -10'd109;
 end
10'd110:
 begin
 sin = 10'd52;
 cos = -10'd110;
 end
10'd111:
 begin
 sin = 10'd49;
 cos = -10'd111;
 end
10'd112:
 begin
 sin = 10'd46;
 cos = -10'd112;
 end
10'd113:
 begin
 sin = 10'd43;
 cos = -10'd113;
 end
10'd114:
 begin
 sin = 10'd41;
 cos = -10'd115;
 end
10'd115:
 begin
 sin = 10'd38;
 cos = -10'd115;
 end
10'd116:
 begin
 sin = 10'd35;
 cos = -10'd116;
 end
10'd117:
 begin
 sin = 10'd32;
 cos = -10'd117;
 end
10'd118:
 begin
 sin = 10'd29;
 cos = -10'd118;
 end
10'd119:
 begin
 sin = 10'd26;
 cos = -10'd119;
 end
10'd120:
 begin
 sin = 10'd23;
 cos = -10'd119;
 end
10'd121:
 begin
 sin = 10'd20;
 cos = -10'd120;
 end
10'd122:
 begin
 sin = 10'd17;
 cos = -10'd120;
 end
10'd123:
 begin
 sin = 10'd15;
 cos = -10'd121;
 end
10'd124:
 begin
 sin = 10'd12;
 cos = -10'd121;
 end
10'd125:
 begin
 sin = 10'd9;
 cos = -10'd121;
 end
10'd126:
 begin
 sin = 10'd6;
 cos = -10'd121;
 end
10'd127:
 begin
 sin = 10'd3;
 cos = -10'd121;
 end
10'd128:
 begin
 sin = -10'd0;
 cos = -10'd121;
 end
10'd129:
 begin
 sin = -10'd3;
 cos = -10'd121;
 end
10'd130:
 begin
 sin = -10'd6;
 cos = -10'd121;
 end
10'd131:
 begin
 sin = -10'd9;
 cos = -10'd121;
 end
10'd132:
 begin
 sin = -10'd12;
 cos = -10'd121;
 end
10'd133:
 begin
 sin = -10'd15;
 cos = -10'd121;
 end
10'd134:
 begin
 sin = -10'd18;
 cos = -10'd120;
 end
10'd135:
 begin
 sin = -10'd21;
 cos = -10'd120;
 end
10'd136:
 begin
 sin = -10'd24;
 cos = -10'd119;
 end
10'd137:
 begin
 sin = -10'd27;
 cos = -10'd118;
 end
10'd138:
 begin
 sin = -10'd30;
 cos = -10'd118;
 end
10'd139:
 begin
 sin = -10'd33;
 cos = -10'd117;
 end
10'd140:
 begin
 sin = -10'd36;
 cos = -10'd116;
 end
10'd141:
 begin
 sin = -10'd39;
 cos = -10'd115;
 end
10'd142:
 begin
 sin = -10'd41;
 cos = -10'd114;
 end
10'd143:
 begin
 sin = -10'd44;
 cos = -10'd113;
 end
10'd144:
 begin
 sin = -10'd47;
 cos = -10'd112;
 end
10'd145:
 begin
 sin = -10'd50;
 cos = -10'd111;
 end
10'd146:
 begin
 sin = -10'd52;
 cos = -10'd110;
 end
10'd147:
 begin
 sin = -10'd55;
 cos = -10'd108;
 end
10'd148:
 begin
 sin = -10'd58;
 cos = -10'd107;
 end
10'd149:
 begin
 sin = -10'd60;
 cos = -10'd106;
 end
10'd150:
 begin
 sin = -10'd63;
 cos = -10'd104;
 end
10'd151:
 begin
 sin = -10'd65;
 cos = -10'd102;
 end
10'd152:
 begin
 sin = -10'd68;
 cos = -10'd101;
 end
10'd153:
 begin
 sin = -10'd70;
 cos = -10'd99;
 end
10'd154:
 begin
 sin = -10'd73;
 cos = -10'd97;
 end
10'd155:
 begin
 sin = -10'd75;
 cos = -10'd96;
 end
10'd156:
 begin
 sin = -10'd77;
 cos = -10'd94;
 end
10'd157:
 begin
 sin = -10'd80;
 cos = -10'd92;
 end
10'd158:
 begin
 sin = -10'd82;
 cos = -10'd90;
 end
10'd159:
 begin
 sin = -10'd84;
 cos = -10'd88;
 end
10'd160:
 begin
 sin = -10'd86;
 cos = -10'd86;
 end
10'd161:
 begin
 sin = -10'd88;
 cos = -10'd83;
 end
10'd162:
 begin
 sin = -10'd90;
 cos = -10'd81;
 end
10'd163:
 begin
 sin = -10'd92;
 cos = -10'd79;
 end
10'd164:
 begin
 sin = -10'd94;
 cos = -10'd77;
 end
10'd165:
 begin
 sin = -10'd96;
 cos = -10'd74;
 end
10'd166:
 begin
 sin = -10'd98;
 cos = -10'd72;
 end
10'd167:
 begin
 sin = -10'd100;
 cos = -10'd70;
 end
10'd168:
 begin
 sin = -10'd101;
 cos = -10'd67;
 end
10'd169:
 begin
 sin = -10'd103;
 cos = -10'd65;
 end
10'd170:
 begin
 sin = -10'd104;
 cos = -10'd62;
 end
10'd171:
 begin
 sin = -10'd106;
 cos = -10'd59;
 end
10'd172:
 begin
 sin = -10'd107;
 cos = -10'd57;
 end
10'd173:
 begin
 sin = -10'd109;
 cos = -10'd54;
 end
10'd174:
 begin
 sin = -10'd110;
 cos = -10'd51;
 end
10'd175:
 begin
 sin = -10'd111;
 cos = -10'd49;
 end
10'd176:
 begin
 sin = -10'd112;
 cos = -10'd46;
 end
10'd177:
 begin
 sin = -10'd114;
 cos = -10'd43;
 end
10'd178:
 begin
 sin = -10'd115;
 cos = -10'd40;
 end
10'd179:
 begin
 sin = -10'd116;
 cos = -10'd38;
 end
10'd180:
 begin
 sin = -10'd116;
 cos = -10'd35;
 end
10'd181:
 begin
 sin = -10'd117;
 cos = -10'd32;
 end
10'd182:
 begin
 sin = -10'd118;
 cos = -10'd29;
 end
10'd183:
 begin
 sin = -10'd119;
 cos = -10'd26;
 end
10'd184:
 begin
 sin = -10'd119;
 cos = -10'd23;
 end
10'd185:
 begin
 sin = -10'd120;
 cos = -10'd20;
 end
10'd186:
 begin
 sin = -10'd120;
 cos = -10'd17;
 end
10'd187:
 begin
 sin = -10'd121;
 cos = -10'd14;
 end
10'd188:
 begin
 sin = -10'd121;
 cos = -10'd11;
 end
10'd189:
 begin
 sin = -10'd121;
 cos = -10'd8;
 end
10'd190:
 begin
 sin = -10'd121;
 cos = -10'd5;
 end
10'd191:
 begin
 sin = -10'd121;
 cos = -10'd2;
 end
10'd192:
 begin
 sin = -10'd121;
 cos = 10'd1;
 end
10'd193:
 begin
 sin = -10'd121;
 cos = 10'd4;
 end
10'd194:
 begin
 sin = -10'd121;
 cos = 10'd7;
 end
10'd195:
 begin
 sin = -10'd121;
 cos = 10'd10;
 end
10'd196:
 begin
 sin = -10'd121;
 cos = 10'd12;
 end
10'd197:
 begin
 sin = -10'd121;
 cos = 10'd15;
 end
10'd198:
 begin
 sin = -10'd120;
 cos = 10'd18;
 end
10'd199:
 begin
 sin = -10'd120;
 cos = 10'd21;
 end
10'd200:
 begin
 sin = -10'd119;
 cos = 10'd24;
 end
10'd201:
 begin
 sin = -10'd118;
 cos = 10'd27;
 end
10'd202:
 begin
 sin = -10'd118;
 cos = 10'd30;
 end
10'd203:
 begin
 sin = -10'd117;
 cos = 10'd33;
 end
10'd204:
 begin
 sin = -10'd116;
 cos = 10'd36;
 end
10'd205:
 begin
 sin = -10'd115;
 cos = 10'd39;
 end
10'd206:
 begin
 sin = -10'd114;
 cos = 10'd41;
 end
10'd207:
 begin
 sin = -10'd113;
 cos = 10'd44;
 end
10'd208:
 begin
 sin = -10'd112;
 cos = 10'd47;
 end
10'd209:
 begin
 sin = -10'd111;
 cos = 10'd50;
 end
10'd210:
 begin
 sin = -10'd110;
 cos = 10'd53;
 end
10'd211:
 begin
 sin = -10'd108;
 cos = 10'd55;
 end
10'd212:
 begin
 sin = -10'd107;
 cos = 10'd58;
 end
10'd213:
 begin
 sin = -10'd105;
 cos = 10'd60;
 end
10'd214:
 begin
 sin = -10'd104;
 cos = 10'd63;
 end
10'd215:
 begin
 sin = -10'd102;
 cos = 10'd66;
 end
10'd216:
 begin
 sin = -10'd101;
 cos = 10'd68;
 end
10'd217:
 begin
 sin = -10'd99;
 cos = 10'd70;
 end
10'd218:
 begin
 sin = -10'd97;
 cos = 10'd73;
 end
10'd219:
 begin
 sin = -10'd95;
 cos = 10'd75;
 end
10'd220:
 begin
 sin = -10'd94;
 cos = 10'd78;
 end
10'd221:
 begin
 sin = -10'd92;
 cos = 10'd80;
 end
10'd222:
 begin
 sin = -10'd90;
 cos = 10'd82;
 end
10'd223:
 begin
 sin = -10'd88;
 cos = 10'd84;
 end
10'd224:
 begin
 sin = -10'd85;
 cos = 10'd86;
 end
10'd225:
 begin
 sin = -10'd83;
 cos = 10'd88;
 end
10'd226:
 begin
 sin = -10'd81;
 cos = 10'd90;
 end
10'd227:
 begin
 sin = -10'd79;
 cos = 10'd92;
 end
10'd228:
 begin
 sin = -10'd77;
 cos = 10'd94;
 end
10'd229:
 begin
 sin = -10'd74;
 cos = 10'd96;
 end
10'd230:
 begin
 sin = -10'd72;
 cos = 10'd98;
 end
10'd231:
 begin
 sin = -10'd69;
 cos = 10'd100;
 end
10'd232:
 begin
 sin = -10'd67;
 cos = 10'd101;
 end
10'd233:
 begin
 sin = -10'd64;
 cos = 10'd103;
 end
10'd234:
 begin
 sin = -10'd62;
 cos = 10'd105;
 end
10'd235:
 begin
 sin = -10'd59;
 cos = 10'd106;
 end
10'd236:
 begin
 sin = -10'd57;
 cos = 10'd107;
 end
10'd237:
 begin
 sin = -10'd54;
 cos = 10'd109;
 end
10'd238:
 begin
 sin = -10'd51;
 cos = 10'd110;
 end
10'd239:
 begin
 sin = -10'd49;
 cos = 10'd111;
 end
10'd240:
 begin
 sin = -10'd46;
 cos = 10'd113;
 end
10'd241:
 begin
 sin = -10'd43;
 cos = 10'd114;
 end
10'd242:
 begin
 sin = -10'd40;
 cos = 10'd115;
 end
10'd243:
 begin
 sin = -10'd37;
 cos = 10'd116;
 end
10'd244:
 begin
 sin = -10'd35;
 cos = 10'd116;
 end
10'd245:
 begin
 sin = -10'd32;
 cos = 10'd117;
 end
10'd246:
 begin
 sin = -10'd29;
 cos = 10'd118;
 end
10'd247:
 begin
 sin = -10'd26;
 cos = 10'd119;
 end
10'd248:
 begin
 sin = -10'd23;
 cos = 10'd119;
 end
10'd249:
 begin
 sin = -10'd20;
 cos = 10'd120;
 end
10'd250:
 begin
 sin = -10'd17;
 cos = 10'd120;
 end
10'd251:
 begin
 sin = -10'd14;
 cos = 10'd121;
 end
10'd252:
 begin
 sin = -10'd11;
 cos = 10'd121;
 end
10'd253:
 begin
 sin = -10'd8;
 cos = 10'd121;
 end
10'd254:
 begin
 sin = -10'd5;
 cos = 10'd121;
 end
10'd255:
 begin
 sin = -10'd2;
 cos = 10'd121;
 end
10'd256:
 begin
 sin = 10'd1;
 cos = 10'd121;
 end
10'd257:
 begin
 sin = 10'd4;
 cos = 10'd121;
 end
10'd258:
 begin
 sin = 10'd7;
 cos = 10'd121;
 end
10'd259:
 begin
 sin = 10'd10;
 cos = 10'd121;
 end
10'd260:
 begin
 sin = 10'd13;
 cos = 10'd121;
 end
10'd261:
 begin
 sin = 10'd16;
 cos = 10'd120;
 end
10'd262:
 begin
 sin = 10'd19;
 cos = 10'd120;
 end
10'd263:
 begin
 sin = 10'd22;
 cos = 10'd120;
 end
10'd264:
 begin
 sin = 10'd24;
 cos = 10'd119;
 end
10'd265:
 begin
 sin = 10'd27;
 cos = 10'd118;
 end
10'd266:
 begin
 sin = 10'd30;
 cos = 10'd118;
 end
10'd267:
 begin
 sin = 10'd33;
 cos = 10'd117;
 end
10'd268:
 begin
 sin = 10'd36;
 cos = 10'd116;
 end
10'd269:
 begin
 sin = 10'd39;
 cos = 10'd115;
 end
10'd270:
 begin
 sin = 10'd42;
 cos = 10'd114;
 end
10'd271:
 begin
 sin = 10'd44;
 cos = 10'd113;
 end
10'd272:
 begin
 sin = 10'd47;
 cos = 10'd112;
 end
10'd273:
 begin
 sin = 10'd50;
 cos = 10'd111;
 end
10'd274:
 begin
 sin = 10'd53;
 cos = 10'd109;
 end
10'd275:
 begin
 sin = 10'd55;
 cos = 10'd108;
 end
10'd276:
 begin
 sin = 10'd58;
 cos = 10'd107;
 end
10'd277:
 begin
 sin = 10'd61;
 cos = 10'd105;
 end
10'd278:
 begin
 sin = 10'd63;
 cos = 10'd104;
 end
10'd279:
 begin
 sin = 10'd66;
 cos = 10'd102;
 end
10'd280:
 begin
 sin = 10'd68;
 cos = 10'd101;
 end
10'd281:
 begin
 sin = 10'd71;
 cos = 10'd99;
 end
10'd282:
 begin
 sin = 10'd73;
 cos = 10'd97;
 end
10'd283:
 begin
 sin = 10'd75;
 cos = 10'd95;
 end
10'd284:
 begin
 sin = 10'd78;
 cos = 10'd93;
 end
10'd285:
 begin
 sin = 10'd80;
 cos = 10'd91;
 end
10'd286:
 begin
 sin = 10'd82;
 cos = 10'd89;
 end
10'd287:
 begin
 sin = 10'd84;
 cos = 10'd87;
 end
10'd288:
 begin
 sin = 10'd87;
 cos = 10'd85;
 end
10'd289:
 begin
 sin = 10'd89;
 cos = 10'd83;
 end
10'd290:
 begin
 sin = 10'd91;
 cos = 10'd81;
 end
10'd291:
 begin
 sin = 10'd93;
 cos = 10'd79;
 end
10'd292:
 begin
 sin = 10'd94;
 cos = 10'd76;
 end
10'd293:
 begin
 sin = 10'd96;
 cos = 10'd74;
 end
10'd294:
 begin
 sin = 10'd98;
 cos = 10'd72;
 end
10'd295:
 begin
 sin = 10'd100;
 cos = 10'd69;
 end
10'd296:
 begin
 sin = 10'd102;
 cos = 10'd67;
 end
10'd297:
 begin
 sin = 10'd103;
 cos = 10'd64;
 end
10'd298:
 begin
 sin = 10'd105;
 cos = 10'd62;
 end
10'd299:
 begin
 sin = 10'd106;
 cos = 10'd59;
 end
10'd300:
 begin
 sin = 10'd108;
 cos = 10'd57;
 end
10'd301:
 begin
 sin = 10'd109;
 cos = 10'd54;
 end
10'd302:
 begin
 sin = 10'd110;
 cos = 10'd51;
 end
10'd303:
 begin
 sin = 10'd111;
 cos = 10'd48;
 end
10'd304:
 begin
 sin = 10'd113;
 cos = 10'd46;
 end
10'd305:
 begin
 sin = 10'd114;
 cos = 10'd43;
 end
10'd306:
 begin
 sin = 10'd115;
 cos = 10'd40;
 end
10'd307:
 begin
 sin = 10'd116;
 cos = 10'd37;
 end
10'd308:
 begin
 sin = 10'd117;
 cos = 10'd34;
 end
10'd309:
 begin
 sin = 10'd117;
 cos = 10'd32;
 end
10'd310:
 begin
 sin = 10'd118;
 cos = 10'd29;
 end
10'd311:
 begin
 sin = 10'd119;
 cos = 10'd26;
 end
10'd312:
 begin
 sin = 10'd119;
 cos = 10'd23;
 end
10'd313:
 begin
 sin = 10'd120;
 cos = 10'd20;
 end
10'd314:
 begin
 sin = 10'd120;
 cos = 10'd17;
 end
10'd315:
 begin
 sin = 10'd121;
 cos = 10'd14;
 end
10'd316:
 begin
 sin = 10'd121;
 cos = 10'd11;
 end
10'd317:
 begin
 sin = 10'd121;
 cos = 10'd8;
 end
10'd318:
 begin
 sin = 10'd121;
 cos = 10'd5;
 end
10'd319:
 begin
 sin = 10'd121;
 cos = 10'd2;
 end
10'd320:
 begin
 sin = 10'd121;
 cos = -10'd1;
 end
10'd321:
 begin
 sin = 10'd121;
 cos = -10'd4;
 end
10'd322:
 begin
 sin = 10'd121;
 cos = -10'd7;
 end
10'd323:
 begin
 sin = 10'd121;
 cos = -10'd10;
 end
10'd324:
 begin
 sin = 10'd121;
 cos = -10'd13;
 end
10'd325:
 begin
 sin = 10'd120;
 cos = -10'd16;
 end
10'd326:
 begin
 sin = 10'd120;
 cos = -10'd19;
 end
10'd327:
 begin
 sin = 10'd120;
 cos = -10'd22;
 end
10'd328:
 begin
 sin = 10'd119;
 cos = -10'd25;
 end
10'd329:
 begin
 sin = 10'd118;
 cos = -10'd28;
 end
10'd330:
 begin
 sin = 10'd118;
 cos = -10'd30;
 end
10'd331:
 begin
 sin = 10'd117;
 cos = -10'd33;
 end
10'd332:
 begin
 sin = 10'd116;
 cos = -10'd36;
 end
10'd333:
 begin
 sin = 10'd115;
 cos = -10'd39;
 end
10'd334:
 begin
 sin = 10'd114;
 cos = -10'd42;
 end
10'd335:
 begin
 sin = 10'd113;
 cos = -10'd45;
 end
10'd336:
 begin
 sin = 10'd112;
 cos = -10'd47;
 end
10'd337:
 begin
 sin = 10'd111;
 cos = -10'd50;
 end
10'd338:
 begin
 sin = 10'd109;
 cos = -10'd53;
 end
10'd339:
 begin
 sin = 10'd108;
 cos = -10'd56;
 end
10'd340:
 begin
 sin = 10'd107;
 cos = -10'd58;
 end
10'd341:
 begin
 sin = 10'd105;
 cos = -10'd61;
 end
10'd342:
 begin
 sin = 10'd104;
 cos = -10'd63;
 end
10'd343:
 begin
 sin = 10'd102;
 cos = -10'd66;
 end
10'd344:
 begin
 sin = 10'd100;
 cos = -10'd68;
 end
10'd345:
 begin
 sin = 10'd99;
 cos = -10'd71;
 end
10'd346:
 begin
 sin = 10'd97;
 cos = -10'd73;
 end
10'd347:
 begin
 sin = 10'd95;
 cos = -10'd76;
 end
10'd348:
 begin
 sin = 10'd93;
 cos = -10'd78;
 end
10'd349:
 begin
 sin = 10'd91;
 cos = -10'd80;
 end
10'd350:
 begin
 sin = 10'd89;
 cos = -10'd82;
 end
10'd351:
 begin
 sin = 10'd87;
 cos = -10'd85;
 end
10'd352:
 begin
 sin = 10'd85;
 cos = -10'd87;
 end
10'd353:
 begin
 sin = 10'd83;
 cos = -10'd89;
 end
10'd354:
 begin
 sin = 10'd81;
 cos = -10'd91;
 end
10'd355:
 begin
 sin = 10'd79;
 cos = -10'd93;
 end
10'd356:
 begin
 sin = 10'd76;
 cos = -10'd95;
 end
10'd357:
 begin
 sin = 10'd74;
 cos = -10'd96;
 end
10'd358:
 begin
 sin = 10'd72;
 cos = -10'd98;
 end
10'd359:
 begin
 sin = 10'd69;
 cos = -10'd100;
 end
10'd360:
 begin
 sin = 10'd67;
 cos = -10'd102;
 end
10'd361:
 begin
 sin = 10'd64;
 cos = -10'd103;
 end
10'd362:
 begin
 sin = 10'd62;
 cos = -10'd105;
 end
10'd363:
 begin
 sin = 10'd59;
 cos = -10'd106;
 end
10'd364:
 begin
 sin = 10'd56;
 cos = -10'd108;
 end
10'd365:
 begin
 sin = 10'd54;
 cos = -10'd109;
 end
10'd366:
 begin
 sin = 10'd51;
 cos = -10'd110;
 end
10'd367:
 begin
 sin = 10'd48;
 cos = -10'd112;
 end
10'd368:
 begin
 sin = 10'd46;
 cos = -10'd113;
 end
10'd369:
 begin
 sin = 10'd43;
 cos = -10'd114;
 end
10'd370:
 begin
 sin = 10'd40;
 cos = -10'd115;
 end
10'd371:
 begin
 sin = 10'd37;
 cos = -10'd116;
 end
10'd372:
 begin
 sin = 10'd34;
 cos = -10'd117;
 end
10'd373:
 begin
 sin = 10'd31;
 cos = -10'd117;
 end
10'd374:
 begin
 sin = 10'd28;
 cos = -10'd118;
 end
10'd375:
 begin
 sin = 10'd26;
 cos = -10'd119;
 end
10'd376:
 begin
 sin = 10'd23;
 cos = -10'd119;
 end
10'd377:
 begin
 sin = 10'd20;
 cos = -10'd120;
 end
10'd378:
 begin
 sin = 10'd17;
 cos = -10'd120;
 end
10'd379:
 begin
 sin = 10'd14;
 cos = -10'd121;
 end
10'd380:
 begin
 sin = 10'd11;
 cos = -10'd121;
 end
10'd381:
 begin
 sin = 10'd8;
 cos = -10'd121;
 end
10'd382:
 begin
 sin = 10'd5;
 cos = -10'd121;
 end
10'd383:
 begin
 sin = 10'd2;
 cos = -10'd121;
 end
10'd384:
 begin
 sin = -10'd1;
 cos = -10'd121;
 end
10'd385:
 begin
 sin = -10'd4;
 cos = -10'd121;
 end
10'd386:
 begin
 sin = -10'd7;
 cos = -10'd121;
 end
10'd387:
 begin
 sin = -10'd10;
 cos = -10'd121;
 end
10'd388:
 begin
 sin = -10'd13;
 cos = -10'd121;
 end
10'd389:
 begin
 sin = -10'd16;
 cos = -10'd120;
 end
10'd390:
 begin
 sin = -10'd19;
 cos = -10'd120;
 end
10'd391:
 begin
 sin = -10'd22;
 cos = -10'd120;
 end
10'd392:
 begin
 sin = -10'd25;
 cos = -10'd119;
 end
10'd393:
 begin
 sin = -10'd28;
 cos = -10'd118;
 end
10'd394:
 begin
 sin = -10'd31;
 cos = -10'd118;
 end
10'd395:
 begin
 sin = -10'd34;
 cos = -10'd117;
 end
10'd396:
 begin
 sin = -10'd36;
 cos = -10'd116;
 end
10'd397:
 begin
 sin = -10'd39;
 cos = -10'd115;
 end
10'd398:
 begin
 sin = -10'd42;
 cos = -10'd114;
 end
10'd399:
 begin
 sin = -10'd45;
 cos = -10'd113;
 end
10'd400:
 begin
 sin = -10'd48;
 cos = -10'd112;
 end
10'd401:
 begin
 sin = -10'd50;
 cos = -10'd111;
 end
10'd402:
 begin
 sin = -10'd53;
 cos = -10'd109;
 end
10'd403:
 begin
 sin = -10'd56;
 cos = -10'd108;
 end
10'd404:
 begin
 sin = -10'd58;
 cos = -10'd107;
 end
10'd405:
 begin
 sin = -10'd61;
 cos = -10'd105;
 end
10'd406:
 begin
 sin = -10'd63;
 cos = -10'd104;
 end
10'd407:
 begin
 sin = -10'd66;
 cos = -10'd102;
 end
10'd408:
 begin
 sin = -10'd68;
 cos = -10'd100;
 end
10'd409:
 begin
 sin = -10'd71;
 cos = -10'd99;
 end
10'd410:
 begin
 sin = -10'd73;
 cos = -10'd97;
 end
10'd411:
 begin
 sin = -10'd76;
 cos = -10'd95;
 end
10'd412:
 begin
 sin = -10'd78;
 cos = -10'd93;
 end
10'd413:
 begin
 sin = -10'd80;
 cos = -10'd91;
 end
10'd414:
 begin
 sin = -10'd82;
 cos = -10'd89;
 end
10'd415:
 begin
 sin = -10'd85;
 cos = -10'd87;
 end
10'd416:
 begin
 sin = -10'd87;
 cos = -10'd85;
 end
10'd417:
 begin
 sin = -10'd89;
 cos = -10'd83;
 end
10'd418:
 begin
 sin = -10'd91;
 cos = -10'd81;
 end
10'd419:
 begin
 sin = -10'd93;
 cos = -10'd78;
 end
10'd420:
 begin
 sin = -10'd95;
 cos = -10'd76;
 end
10'd421:
 begin
 sin = -10'd97;
 cos = -10'd74;
 end
10'd422:
 begin
 sin = -10'd98;
 cos = -10'd71;
 end
10'd423:
 begin
 sin = -10'd100;
 cos = -10'd69;
 end
10'd424:
 begin
 sin = -10'd102;
 cos = -10'd66;
 end
10'd425:
 begin
 sin = -10'd103;
 cos = -10'd64;
 end
10'd426:
 begin
 sin = -10'd105;
 cos = -10'd61;
 end
10'd427:
 begin
 sin = -10'd106;
 cos = -10'd59;
 end
10'd428:
 begin
 sin = -10'd108;
 cos = -10'd56;
 end
10'd429:
 begin
 sin = -10'd109;
 cos = -10'd54;
 end
10'd430:
 begin
 sin = -10'd110;
 cos = -10'd51;
 end
10'd431:
 begin
 sin = -10'd112;
 cos = -10'd48;
 end
10'd432:
 begin
 sin = -10'd113;
 cos = -10'd45;
 end
10'd433:
 begin
 sin = -10'd114;
 cos = -10'd43;
 end
10'd434:
 begin
 sin = -10'd115;
 cos = -10'd40;
 end
10'd435:
 begin
 sin = -10'd116;
 cos = -10'd37;
 end
10'd436:
 begin
 sin = -10'd117;
 cos = -10'd34;
 end
10'd437:
 begin
 sin = -10'd117;
 cos = -10'd31;
 end
10'd438:
 begin
 sin = -10'd118;
 cos = -10'd28;
 end
10'd439:
 begin
 sin = -10'd119;
 cos = -10'd25;
 end
10'd440:
 begin
 sin = -10'd119;
 cos = -10'd22;
 end
10'd441:
 begin
 sin = -10'd120;
 cos = -10'd20;
 end
10'd442:
 begin
 sin = -10'd120;
 cos = -10'd17;
 end
10'd443:
 begin
 sin = -10'd121;
 cos = -10'd14;
 end
10'd444:
 begin
 sin = -10'd121;
 cos = -10'd11;
 end
10'd445:
 begin
 sin = -10'd121;
 cos = -10'd8;
 end
10'd446:
 begin
 sin = -10'd121;
 cos = -10'd5;
 end
10'd447:
 begin
 sin = -10'd121;
 cos = -10'd2;
 end
10'd448:
 begin
 sin = -10'd121;
 cos = 10'd1;
 end
10'd449:
 begin
 sin = -10'd121;
 cos = 10'd4;
 end
10'd450:
 begin
 sin = -10'd121;
 cos = 10'd7;
 end
10'd451:
 begin
 sin = -10'd121;
 cos = 10'd10;
 end
10'd452:
 begin
 sin = -10'd121;
 cos = 10'd13;
 end
10'd453:
 begin
 sin = -10'd120;
 cos = 10'd16;
 end
10'd454:
 begin
 sin = -10'd120;
 cos = 10'd19;
 end
10'd455:
 begin
 sin = -10'd119;
 cos = 10'd22;
 end
10'd456:
 begin
 sin = -10'd119;
 cos = 10'd25;
 end
10'd457:
 begin
 sin = -10'd118;
 cos = 10'd28;
 end
10'd458:
 begin
 sin = -10'd118;
 cos = 10'd31;
 end
10'd459:
 begin
 sin = -10'd117;
 cos = 10'd34;
 end
10'd460:
 begin
 sin = -10'd116;
 cos = 10'd37;
 end
10'd461:
 begin
 sin = -10'd115;
 cos = 10'd39;
 end
10'd462:
 begin
 sin = -10'd114;
 cos = 10'd42;
 end
10'd463:
 begin
 sin = -10'd113;
 cos = 10'd45;
 end
10'd464:
 begin
 sin = -10'd112;
 cos = 10'd48;
 end
10'd465:
 begin
 sin = -10'd111;
 cos = 10'd50;
 end
10'd466:
 begin
 sin = -10'd109;
 cos = 10'd53;
 end
10'd467:
 begin
 sin = -10'd108;
 cos = 10'd56;
 end
10'd468:
 begin
 sin = -10'd107;
 cos = 10'd58;
 end
10'd469:
 begin
 sin = -10'd105;
 cos = 10'd61;
 end
10'd470:
 begin
 sin = -10'd104;
 cos = 10'd64;
 end
10'd471:
 begin
 sin = -10'd102;
 cos = 10'd66;
 end
10'd472:
 begin
 sin = -10'd100;
 cos = 10'd69;
 end
10'd473:
 begin
 sin = -10'd99;
 cos = 10'd71;
 end
10'd474:
 begin
 sin = -10'd97;
 cos = 10'd73;
 end
10'd475:
 begin
 sin = -10'd95;
 cos = 10'd76;
 end
10'd476:
 begin
 sin = -10'd93;
 cos = 10'd78;
 end
10'd477:
 begin
 sin = -10'd91;
 cos = 10'd80;
 end
10'd478:
 begin
 sin = -10'd89;
 cos = 10'd83;
 end
10'd479:
 begin
 sin = -10'd87;
 cos = 10'd85;
 end
10'd480:
 begin
 sin = -10'd85;
 cos = 10'd87;
 end
10'd481:
 begin
 sin = -10'd83;
 cos = 10'd89;
 end
10'd482:
 begin
 sin = -10'd81;
 cos = 10'd91;
 end
10'd483:
 begin
 sin = -10'd78;
 cos = 10'd93;
 end
10'd484:
 begin
 sin = -10'd76;
 cos = 10'd95;
 end
10'd485:
 begin
 sin = -10'd74;
 cos = 10'd97;
 end
10'd486:
 begin
 sin = -10'd71;
 cos = 10'd98;
 end
10'd487:
 begin
 sin = -10'd69;
 cos = 10'd100;
 end
10'd488:
 begin
 sin = -10'd66;
 cos = 10'd102;
 end
10'd489:
 begin
 sin = -10'd64;
 cos = 10'd103;
 end
10'd490:
 begin
 sin = -10'd61;
 cos = 10'd105;
 end
10'd491:
 begin
 sin = -10'd59;
 cos = 10'd106;
 end
10'd492:
 begin
 sin = -10'd56;
 cos = 10'd108;
 end
10'd493:
 begin
 sin = -10'd53;
 cos = 10'd109;
 end
10'd494:
 begin
 sin = -10'd51;
 cos = 10'd110;
 end
10'd495:
 begin
 sin = -10'd48;
 cos = 10'd112;
 end
10'd496:
 begin
 sin = -10'd45;
 cos = 10'd113;
 end
10'd497:
 begin
 sin = -10'd42;
 cos = 10'd114;
 end
10'd498:
 begin
 sin = -10'd40;
 cos = 10'd115;
 end
10'd499:
 begin
 sin = -10'd37;
 cos = 10'd116;
 end
10'd500:
 begin
 sin = -10'd34;
 cos = 10'd117;
 end
10'd501:
 begin
 sin = -10'd31;
 cos = 10'd117;
 end
10'd502:
 begin
 sin = -10'd28;
 cos = 10'd118;
 end
10'd503:
 begin
 sin = -10'd25;
 cos = 10'd119;
 end
10'd504:
 begin
 sin = -10'd22;
 cos = 10'd119;
 end
10'd505:
 begin
 sin = -10'd19;
 cos = 10'd120;
 end
10'd506:
 begin
 sin = -10'd16;
 cos = 10'd120;
 end
10'd507:
 begin
 sin = -10'd13;
 cos = 10'd121;
 end
10'd508:
 begin
 sin = -10'd10;
 cos = 10'd121;
 end
10'd509:
 begin
 sin = -10'd7;
 cos = 10'd121;
 end
10'd510:
 begin
 sin = -10'd4;
 cos = 10'd121;
 end
10'd511:
 begin
 sin = -10'd1;
 cos = 10'd121;
 end
10'd512:
 begin
 sin = 10'd1;
 cos = 10'd121;
 end
10'd513:
 begin
 sin = 10'd4;
 cos = 10'd121;
 end
10'd514:
 begin
 sin = 10'd7;
 cos = 10'd121;
 end
10'd515:
 begin
 sin = 10'd10;
 cos = 10'd121;
 end
10'd516:
 begin
 sin = 10'd13;
 cos = 10'd121;
 end
10'd517:
 begin
 sin = 10'd16;
 cos = 10'd120;
 end
10'd518:
 begin
 sin = 10'd19;
 cos = 10'd120;
 end
10'd519:
 begin
 sin = 10'd22;
 cos = 10'd119;
 end
10'd520:
 begin
 sin = 10'd25;
 cos = 10'd119;
 end
10'd521:
 begin
 sin = 10'd28;
 cos = 10'd118;
 end
10'd522:
 begin
 sin = 10'd31;
 cos = 10'd117;
 end
10'd523:
 begin
 sin = 10'd34;
 cos = 10'd117;
 end
10'd524:
 begin
 sin = 10'd37;
 cos = 10'd116;
 end
10'd525:
 begin
 sin = 10'd40;
 cos = 10'd115;
 end
10'd526:
 begin
 sin = 10'd42;
 cos = 10'd114;
 end
10'd527:
 begin
 sin = 10'd45;
 cos = 10'd113;
 end
10'd528:
 begin
 sin = 10'd48;
 cos = 10'd112;
 end
10'd529:
 begin
 sin = 10'd51;
 cos = 10'd110;
 end
10'd530:
 begin
 sin = 10'd53;
 cos = 10'd109;
 end
10'd531:
 begin
 sin = 10'd56;
 cos = 10'd108;
 end
10'd532:
 begin
 sin = 10'd59;
 cos = 10'd106;
 end
10'd533:
 begin
 sin = 10'd61;
 cos = 10'd105;
 end
10'd534:
 begin
 sin = 10'd64;
 cos = 10'd103;
 end
10'd535:
 begin
 sin = 10'd66;
 cos = 10'd102;
 end
10'd536:
 begin
 sin = 10'd69;
 cos = 10'd100;
 end
10'd537:
 begin
 sin = 10'd71;
 cos = 10'd98;
 end
10'd538:
 begin
 sin = 10'd74;
 cos = 10'd97;
 end
10'd539:
 begin
 sin = 10'd76;
 cos = 10'd95;
 end
10'd540:
 begin
 sin = 10'd78;
 cos = 10'd93;
 end
10'd541:
 begin
 sin = 10'd81;
 cos = 10'd91;
 end
10'd542:
 begin
 sin = 10'd83;
 cos = 10'd89;
 end
10'd543:
 begin
 sin = 10'd85;
 cos = 10'd87;
 end
10'd544:
 begin
 sin = 10'd87;
 cos = 10'd85;
 end
10'd545:
 begin
 sin = 10'd89;
 cos = 10'd83;
 end
10'd546:
 begin
 sin = 10'd91;
 cos = 10'd80;
 end
10'd547:
 begin
 sin = 10'd93;
 cos = 10'd78;
 end
10'd548:
 begin
 sin = 10'd95;
 cos = 10'd76;
 end
10'd549:
 begin
 sin = 10'd97;
 cos = 10'd73;
 end
10'd550:
 begin
 sin = 10'd99;
 cos = 10'd71;
 end
10'd551:
 begin
 sin = 10'd100;
 cos = 10'd69;
 end
10'd552:
 begin
 sin = 10'd102;
 cos = 10'd66;
 end
10'd553:
 begin
 sin = 10'd104;
 cos = 10'd64;
 end
10'd554:
 begin
 sin = 10'd105;
 cos = 10'd61;
 end
10'd555:
 begin
 sin = 10'd107;
 cos = 10'd58;
 end
10'd556:
 begin
 sin = 10'd108;
 cos = 10'd56;
 end
10'd557:
 begin
 sin = 10'd109;
 cos = 10'd53;
 end
10'd558:
 begin
 sin = 10'd111;
 cos = 10'd50;
 end
10'd559:
 begin
 sin = 10'd112;
 cos = 10'd48;
 end
10'd560:
 begin
 sin = 10'd113;
 cos = 10'd45;
 end
10'd561:
 begin
 sin = 10'd114;
 cos = 10'd42;
 end
10'd562:
 begin
 sin = 10'd115;
 cos = 10'd39;
 end
10'd563:
 begin
 sin = 10'd116;
 cos = 10'd37;
 end
10'd564:
 begin
 sin = 10'd117;
 cos = 10'd34;
 end
10'd565:
 begin
 sin = 10'd118;
 cos = 10'd31;
 end
10'd566:
 begin
 sin = 10'd118;
 cos = 10'd28;
 end
10'd567:
 begin
 sin = 10'd119;
 cos = 10'd25;
 end
10'd568:
 begin
 sin = 10'd119;
 cos = 10'd22;
 end
10'd569:
 begin
 sin = 10'd120;
 cos = 10'd19;
 end
10'd570:
 begin
 sin = 10'd120;
 cos = 10'd16;
 end
10'd571:
 begin
 sin = 10'd121;
 cos = 10'd13;
 end
10'd572:
 begin
 sin = 10'd121;
 cos = 10'd10;
 end
10'd573:
 begin
 sin = 10'd121;
 cos = 10'd7;
 end
10'd574:
 begin
 sin = 10'd121;
 cos = 10'd4;
 end
10'd575:
 begin
 sin = 10'd121;
 cos = 10'd1;
 end
10'd576:
 begin
 sin = 10'd121;
 cos = -10'd2;
 end
10'd577:
 begin
 sin = 10'd121;
 cos = -10'd5;
 end
10'd578:
 begin
 sin = 10'd121;
 cos = -10'd8;
 end
10'd579:
 begin
 sin = 10'd121;
 cos = -10'd11;
 end
10'd580:
 begin
 sin = 10'd121;
 cos = -10'd14;
 end
10'd581:
 begin
 sin = 10'd120;
 cos = -10'd17;
 end
10'd582:
 begin
 sin = 10'd120;
 cos = -10'd20;
 end
10'd583:
 begin
 sin = 10'd119;
 cos = -10'd22;
 end
10'd584:
 begin
 sin = 10'd119;
 cos = -10'd25;
 end
10'd585:
 begin
 sin = 10'd118;
 cos = -10'd28;
 end
10'd586:
 begin
 sin = 10'd117;
 cos = -10'd31;
 end
10'd587:
 begin
 sin = 10'd117;
 cos = -10'd34;
 end
10'd588:
 begin
 sin = 10'd116;
 cos = -10'd37;
 end
10'd589:
 begin
 sin = 10'd115;
 cos = -10'd40;
 end
10'd590:
 begin
 sin = 10'd114;
 cos = -10'd43;
 end
10'd591:
 begin
 sin = 10'd113;
 cos = -10'd45;
 end
10'd592:
 begin
 sin = 10'd112;
 cos = -10'd48;
 end
10'd593:
 begin
 sin = 10'd110;
 cos = -10'd51;
 end
10'd594:
 begin
 sin = 10'd109;
 cos = -10'd54;
 end
10'd595:
 begin
 sin = 10'd108;
 cos = -10'd56;
 end
10'd596:
 begin
 sin = 10'd106;
 cos = -10'd59;
 end
10'd597:
 begin
 sin = 10'd105;
 cos = -10'd61;
 end
10'd598:
 begin
 sin = 10'd103;
 cos = -10'd64;
 end
10'd599:
 begin
 sin = 10'd102;
 cos = -10'd66;
 end
10'd600:
 begin
 sin = 10'd100;
 cos = -10'd69;
 end
10'd601:
 begin
 sin = 10'd98;
 cos = -10'd71;
 end
10'd602:
 begin
 sin = 10'd97;
 cos = -10'd74;
 end
10'd603:
 begin
 sin = 10'd95;
 cos = -10'd76;
 end
10'd604:
 begin
 sin = 10'd93;
 cos = -10'd78;
 end
10'd605:
 begin
 sin = 10'd91;
 cos = -10'd81;
 end
10'd606:
 begin
 sin = 10'd89;
 cos = -10'd83;
 end
10'd607:
 begin
 sin = 10'd87;
 cos = -10'd85;
 end
10'd608:
 begin
 sin = 10'd85;
 cos = -10'd87;
 end
10'd609:
 begin
 sin = 10'd82;
 cos = -10'd89;
 end
10'd610:
 begin
 sin = 10'd80;
 cos = -10'd91;
 end
10'd611:
 begin
 sin = 10'd78;
 cos = -10'd93;
 end
10'd612:
 begin
 sin = 10'd76;
 cos = -10'd95;
 end
10'd613:
 begin
 sin = 10'd73;
 cos = -10'd97;
 end
10'd614:
 begin
 sin = 10'd71;
 cos = -10'd99;
 end
10'd615:
 begin
 sin = 10'd68;
 cos = -10'd100;
 end
10'd616:
 begin
 sin = 10'd66;
 cos = -10'd102;
 end
10'd617:
 begin
 sin = 10'd63;
 cos = -10'd104;
 end
10'd618:
 begin
 sin = 10'd61;
 cos = -10'd105;
 end
10'd619:
 begin
 sin = 10'd58;
 cos = -10'd107;
 end
10'd620:
 begin
 sin = 10'd56;
 cos = -10'd108;
 end
10'd621:
 begin
 sin = 10'd53;
 cos = -10'd109;
 end
10'd622:
 begin
 sin = 10'd50;
 cos = -10'd111;
 end
10'd623:
 begin
 sin = 10'd48;
 cos = -10'd112;
 end
10'd624:
 begin
 sin = 10'd45;
 cos = -10'd113;
 end
10'd625:
 begin
 sin = 10'd42;
 cos = -10'd114;
 end
10'd626:
 begin
 sin = 10'd39;
 cos = -10'd115;
 end
10'd627:
 begin
 sin = 10'd36;
 cos = -10'd116;
 end
10'd628:
 begin
 sin = 10'd34;
 cos = -10'd117;
 end
10'd629:
 begin
 sin = 10'd31;
 cos = -10'd118;
 end
10'd630:
 begin
 sin = 10'd28;
 cos = -10'd118;
 end
10'd631:
 begin
 sin = 10'd25;
 cos = -10'd119;
 end
10'd632:
 begin
 sin = 10'd22;
 cos = -10'd120;
 end
10'd633:
 begin
 sin = 10'd19;
 cos = -10'd120;
 end
10'd634:
 begin
 sin = 10'd16;
 cos = -10'd120;
 end
10'd635:
 begin
 sin = 10'd13;
 cos = -10'd121;
 end
10'd636:
 begin
 sin = 10'd10;
 cos = -10'd121;
 end
10'd637:
 begin
 sin = 10'd7;
 cos = -10'd121;
 end
10'd638:
 begin
 sin = 10'd4;
 cos = -10'd121;
 end
10'd639:
 begin
 sin = 10'd1;
 cos = -10'd121;
 end
10'd640:
 begin
 sin = -10'd2;
 cos = -10'd121;
 end
10'd641:
 begin
 sin = -10'd5;
 cos = -10'd121;
 end
10'd642:
 begin
 sin = -10'd8;
 cos = -10'd121;
 end
10'd643:
 begin
 sin = -10'd11;
 cos = -10'd121;
 end
10'd644:
 begin
 sin = -10'd14;
 cos = -10'd121;
 end
10'd645:
 begin
 sin = -10'd17;
 cos = -10'd120;
 end
10'd646:
 begin
 sin = -10'd20;
 cos = -10'd120;
 end
10'd647:
 begin
 sin = -10'd23;
 cos = -10'd119;
 end
10'd648:
 begin
 sin = -10'd26;
 cos = -10'd119;
 end
10'd649:
 begin
 sin = -10'd28;
 cos = -10'd118;
 end
10'd650:
 begin
 sin = -10'd31;
 cos = -10'd117;
 end
10'd651:
 begin
 sin = -10'd34;
 cos = -10'd117;
 end
10'd652:
 begin
 sin = -10'd37;
 cos = -10'd116;
 end
10'd653:
 begin
 sin = -10'd40;
 cos = -10'd115;
 end
10'd654:
 begin
 sin = -10'd43;
 cos = -10'd114;
 end
10'd655:
 begin
 sin = -10'd46;
 cos = -10'd113;
 end
10'd656:
 begin
 sin = -10'd48;
 cos = -10'd112;
 end
10'd657:
 begin
 sin = -10'd51;
 cos = -10'd110;
 end
10'd658:
 begin
 sin = -10'd54;
 cos = -10'd109;
 end
10'd659:
 begin
 sin = -10'd56;
 cos = -10'd108;
 end
10'd660:
 begin
 sin = -10'd59;
 cos = -10'd106;
 end
10'd661:
 begin
 sin = -10'd62;
 cos = -10'd105;
 end
10'd662:
 begin
 sin = -10'd64;
 cos = -10'd103;
 end
10'd663:
 begin
 sin = -10'd67;
 cos = -10'd102;
 end
10'd664:
 begin
 sin = -10'd69;
 cos = -10'd100;
 end
10'd665:
 begin
 sin = -10'd72;
 cos = -10'd98;
 end
10'd666:
 begin
 sin = -10'd74;
 cos = -10'd96;
 end
10'd667:
 begin
 sin = -10'd76;
 cos = -10'd95;
 end
10'd668:
 begin
 sin = -10'd79;
 cos = -10'd93;
 end
10'd669:
 begin
 sin = -10'd81;
 cos = -10'd91;
 end
10'd670:
 begin
 sin = -10'd83;
 cos = -10'd89;
 end
10'd671:
 begin
 sin = -10'd85;
 cos = -10'd87;
 end
10'd672:
 begin
 sin = -10'd87;
 cos = -10'd85;
 end
10'd673:
 begin
 sin = -10'd89;
 cos = -10'd82;
 end
10'd674:
 begin
 sin = -10'd91;
 cos = -10'd80;
 end
10'd675:
 begin
 sin = -10'd93;
 cos = -10'd78;
 end
10'd676:
 begin
 sin = -10'd95;
 cos = -10'd76;
 end
10'd677:
 begin
 sin = -10'd97;
 cos = -10'd73;
 end
10'd678:
 begin
 sin = -10'd99;
 cos = -10'd71;
 end
10'd679:
 begin
 sin = -10'd100;
 cos = -10'd68;
 end
10'd680:
 begin
 sin = -10'd102;
 cos = -10'd66;
 end
10'd681:
 begin
 sin = -10'd104;
 cos = -10'd63;
 end
10'd682:
 begin
 sin = -10'd105;
 cos = -10'd61;
 end
10'd683:
 begin
 sin = -10'd107;
 cos = -10'd58;
 end
10'd684:
 begin
 sin = -10'd108;
 cos = -10'd56;
 end
10'd685:
 begin
 sin = -10'd109;
 cos = -10'd53;
 end
10'd686:
 begin
 sin = -10'd111;
 cos = -10'd50;
 end
10'd687:
 begin
 sin = -10'd112;
 cos = -10'd47;
 end
10'd688:
 begin
 sin = -10'd113;
 cos = -10'd45;
 end
10'd689:
 begin
 sin = -10'd114;
 cos = -10'd42;
 end
10'd690:
 begin
 sin = -10'd115;
 cos = -10'd39;
 end
10'd691:
 begin
 sin = -10'd116;
 cos = -10'd36;
 end
10'd692:
 begin
 sin = -10'd117;
 cos = -10'd33;
 end
10'd693:
 begin
 sin = -10'd118;
 cos = -10'd30;
 end
10'd694:
 begin
 sin = -10'd118;
 cos = -10'd28;
 end
10'd695:
 begin
 sin = -10'd119;
 cos = -10'd25;
 end
10'd696:
 begin
 sin = -10'd120;
 cos = -10'd22;
 end
10'd697:
 begin
 sin = -10'd120;
 cos = -10'd19;
 end
10'd698:
 begin
 sin = -10'd120;
 cos = -10'd16;
 end
10'd699:
 begin
 sin = -10'd121;
 cos = -10'd13;
 end
10'd700:
 begin
 sin = -10'd121;
 cos = -10'd10;
 end
10'd701:
 begin
 sin = -10'd121;
 cos = -10'd7;
 end
10'd702:
 begin
 sin = -10'd121;
 cos = -10'd4;
 end
10'd703:
 begin
 sin = -10'd121;
 cos = -10'd1;
 end
10'd704:
 begin
 sin = -10'd121;
 cos = 10'd2;
 end
10'd705:
 begin
 sin = -10'd121;
 cos = 10'd5;
 end
10'd706:
 begin
 sin = -10'd121;
 cos = 10'd8;
 end
10'd707:
 begin
 sin = -10'd121;
 cos = 10'd11;
 end
10'd708:
 begin
 sin = -10'd121;
 cos = 10'd14;
 end
10'd709:
 begin
 sin = -10'd120;
 cos = 10'd17;
 end
10'd710:
 begin
 sin = -10'd120;
 cos = 10'd20;
 end
10'd711:
 begin
 sin = -10'd119;
 cos = 10'd23;
 end
10'd712:
 begin
 sin = -10'd119;
 cos = 10'd26;
 end
10'd713:
 begin
 sin = -10'd118;
 cos = 10'd29;
 end
10'd714:
 begin
 sin = -10'd117;
 cos = 10'd32;
 end
10'd715:
 begin
 sin = -10'd117;
 cos = 10'd34;
 end
10'd716:
 begin
 sin = -10'd116;
 cos = 10'd37;
 end
10'd717:
 begin
 sin = -10'd115;
 cos = 10'd40;
 end
10'd718:
 begin
 sin = -10'd114;
 cos = 10'd43;
 end
10'd719:
 begin
 sin = -10'd113;
 cos = 10'd46;
 end
10'd720:
 begin
 sin = -10'd111;
 cos = 10'd48;
 end
10'd721:
 begin
 sin = -10'd110;
 cos = 10'd51;
 end
10'd722:
 begin
 sin = -10'd109;
 cos = 10'd54;
 end
10'd723:
 begin
 sin = -10'd108;
 cos = 10'd57;
 end
10'd724:
 begin
 sin = -10'd106;
 cos = 10'd59;
 end
10'd725:
 begin
 sin = -10'd105;
 cos = 10'd62;
 end
10'd726:
 begin
 sin = -10'd103;
 cos = 10'd64;
 end
10'd727:
 begin
 sin = -10'd102;
 cos = 10'd67;
 end
10'd728:
 begin
 sin = -10'd100;
 cos = 10'd69;
 end
10'd729:
 begin
 sin = -10'd98;
 cos = 10'd72;
 end
10'd730:
 begin
 sin = -10'd96;
 cos = 10'd74;
 end
10'd731:
 begin
 sin = -10'd94;
 cos = 10'd76;
 end
10'd732:
 begin
 sin = -10'd93;
 cos = 10'd79;
 end
10'd733:
 begin
 sin = -10'd91;
 cos = 10'd81;
 end
10'd734:
 begin
 sin = -10'd89;
 cos = 10'd83;
 end
10'd735:
 begin
 sin = -10'd87;
 cos = 10'd85;
 end
10'd736:
 begin
 sin = -10'd84;
 cos = 10'd87;
 end
10'd737:
 begin
 sin = -10'd82;
 cos = 10'd89;
 end
10'd738:
 begin
 sin = -10'd80;
 cos = 10'd91;
 end
10'd739:
 begin
 sin = -10'd78;
 cos = 10'd93;
 end
10'd740:
 begin
 sin = -10'd75;
 cos = 10'd95;
 end
10'd741:
 begin
 sin = -10'd73;
 cos = 10'd97;
 end
10'd742:
 begin
 sin = -10'd71;
 cos = 10'd99;
 end
10'd743:
 begin
 sin = -10'd68;
 cos = 10'd101;
 end
10'd744:
 begin
 sin = -10'd66;
 cos = 10'd102;
 end
10'd745:
 begin
 sin = -10'd63;
 cos = 10'd104;
 end
10'd746:
 begin
 sin = -10'd61;
 cos = 10'd105;
 end
10'd747:
 begin
 sin = -10'd58;
 cos = 10'd107;
 end
10'd748:
 begin
 sin = -10'd55;
 cos = 10'd108;
 end
10'd749:
 begin
 sin = -10'd53;
 cos = 10'd109;
 end
10'd750:
 begin
 sin = -10'd50;
 cos = 10'd111;
 end
10'd751:
 begin
 sin = -10'd47;
 cos = 10'd112;
 end
10'd752:
 begin
 sin = -10'd44;
 cos = 10'd113;
 end
10'd753:
 begin
 sin = -10'd42;
 cos = 10'd114;
 end
10'd754:
 begin
 sin = -10'd39;
 cos = 10'd115;
 end
10'd755:
 begin
 sin = -10'd36;
 cos = 10'd116;
 end
10'd756:
 begin
 sin = -10'd33;
 cos = 10'd117;
 end
10'd757:
 begin
 sin = -10'd30;
 cos = 10'd118;
 end
10'd758:
 begin
 sin = -10'd27;
 cos = 10'd118;
 end
10'd759:
 begin
 sin = -10'd24;
 cos = 10'd119;
 end
10'd760:
 begin
 sin = -10'd22;
 cos = 10'd120;
 end
10'd761:
 begin
 sin = -10'd19;
 cos = 10'd120;
 end
10'd762:
 begin
 sin = -10'd16;
 cos = 10'd120;
 end
10'd763:
 begin
 sin = -10'd13;
 cos = 10'd121;
 end
10'd764:
 begin
 sin = -10'd10;
 cos = 10'd121;
 end
10'd765:
 begin
 sin = -10'd7;
 cos = 10'd121;
 end
10'd766:
 begin
 sin = -10'd4;
 cos = 10'd121;
 end
10'd767:
 begin
 sin = -10'd1;
 cos = 10'd121;
 end
10'd768:
 begin
 sin = 10'd2;
 cos = 10'd121;
 end
10'd769:
 begin
 sin = 10'd5;
 cos = 10'd121;
 end
10'd770:
 begin
 sin = 10'd8;
 cos = 10'd121;
 end
10'd771:
 begin
 sin = 10'd11;
 cos = 10'd121;
 end
10'd772:
 begin
 sin = 10'd14;
 cos = 10'd121;
 end
10'd773:
 begin
 sin = 10'd17;
 cos = 10'd120;
 end
10'd774:
 begin
 sin = 10'd20;
 cos = 10'd120;
 end
10'd775:
 begin
 sin = 10'd23;
 cos = 10'd119;
 end
10'd776:
 begin
 sin = 10'd26;
 cos = 10'd119;
 end
10'd777:
 begin
 sin = 10'd29;
 cos = 10'd118;
 end
10'd778:
 begin
 sin = 10'd32;
 cos = 10'd117;
 end
10'd779:
 begin
 sin = 10'd35;
 cos = 10'd116;
 end
10'd780:
 begin
 sin = 10'd37;
 cos = 10'd116;
 end
10'd781:
 begin
 sin = 10'd40;
 cos = 10'd115;
 end
10'd782:
 begin
 sin = 10'd43;
 cos = 10'd114;
 end
10'd783:
 begin
 sin = 10'd46;
 cos = 10'd113;
 end
10'd784:
 begin
 sin = 10'd49;
 cos = 10'd111;
 end
10'd785:
 begin
 sin = 10'd51;
 cos = 10'd110;
 end
10'd786:
 begin
 sin = 10'd54;
 cos = 10'd109;
 end
10'd787:
 begin
 sin = 10'd57;
 cos = 10'd107;
 end
10'd788:
 begin
 sin = 10'd59;
 cos = 10'd106;
 end
10'd789:
 begin
 sin = 10'd62;
 cos = 10'd105;
 end
10'd790:
 begin
 sin = 10'd64;
 cos = 10'd103;
 end
10'd791:
 begin
 sin = 10'd67;
 cos = 10'd101;
 end
10'd792:
 begin
 sin = 10'd69;
 cos = 10'd100;
 end
10'd793:
 begin
 sin = 10'd72;
 cos = 10'd98;
 end
10'd794:
 begin
 sin = 10'd74;
 cos = 10'd96;
 end
10'd795:
 begin
 sin = 10'd77;
 cos = 10'd94;
 end
10'd796:
 begin
 sin = 10'd79;
 cos = 10'd92;
 end
10'd797:
 begin
 sin = 10'd81;
 cos = 10'd90;
 end
10'd798:
 begin
 sin = 10'd83;
 cos = 10'd88;
 end
10'd799:
 begin
 sin = 10'd85;
 cos = 10'd86;
 end
10'd800:
 begin
 sin = 10'd88;
 cos = 10'd84;
 end
10'd801:
 begin
 sin = 10'd90;
 cos = 10'd82;
 end
10'd802:
 begin
 sin = 10'd92;
 cos = 10'd80;
 end
10'd803:
 begin
 sin = 10'd94;
 cos = 10'd78;
 end
10'd804:
 begin
 sin = 10'd95;
 cos = 10'd75;
 end
10'd805:
 begin
 sin = 10'd97;
 cos = 10'd73;
 end
10'd806:
 begin
 sin = 10'd99;
 cos = 10'd70;
 end
10'd807:
 begin
 sin = 10'd101;
 cos = 10'd68;
 end
10'd808:
 begin
 sin = 10'd102;
 cos = 10'd66;
 end
10'd809:
 begin
 sin = 10'd104;
 cos = 10'd63;
 end
10'd810:
 begin
 sin = 10'd105;
 cos = 10'd60;
 end
10'd811:
 begin
 sin = 10'd107;
 cos = 10'd58;
 end
10'd812:
 begin
 sin = 10'd108;
 cos = 10'd55;
 end
10'd813:
 begin
 sin = 10'd110;
 cos = 10'd53;
 end
10'd814:
 begin
 sin = 10'd111;
 cos = 10'd50;
 end
10'd815:
 begin
 sin = 10'd112;
 cos = 10'd47;
 end
10'd816:
 begin
 sin = 10'd113;
 cos = 10'd44;
 end
10'd817:
 begin
 sin = 10'd114;
 cos = 10'd41;
 end
10'd818:
 begin
 sin = 10'd115;
 cos = 10'd39;
 end
10'd819:
 begin
 sin = 10'd116;
 cos = 10'd36;
 end
10'd820:
 begin
 sin = 10'd117;
 cos = 10'd33;
 end
10'd821:
 begin
 sin = 10'd118;
 cos = 10'd30;
 end
10'd822:
 begin
 sin = 10'd118;
 cos = 10'd27;
 end
10'd823:
 begin
 sin = 10'd119;
 cos = 10'd24;
 end
10'd824:
 begin
 sin = 10'd120;
 cos = 10'd21;
 end
10'd825:
 begin
 sin = 10'd120;
 cos = 10'd18;
 end
10'd826:
 begin
 sin = 10'd121;
 cos = 10'd15;
 end
10'd827:
 begin
 sin = 10'd121;
 cos = 10'd12;
 end
10'd828:
 begin
 sin = 10'd121;
 cos = 10'd10;
 end
10'd829:
 begin
 sin = 10'd121;
 cos = 10'd7;
 end
10'd830:
 begin
 sin = 10'd121;
 cos = 10'd4;
 end
10'd831:
 begin
 sin = 10'd121;
 cos = 10'd1;
 end
10'd832:
 begin
 sin = 10'd121;
 cos = -10'd2;
 end
10'd833:
 begin
 sin = 10'd121;
 cos = -10'd5;
 end
10'd834:
 begin
 sin = 10'd121;
 cos = -10'd8;
 end
10'd835:
 begin
 sin = 10'd121;
 cos = -10'd11;
 end
10'd836:
 begin
 sin = 10'd121;
 cos = -10'd14;
 end
10'd837:
 begin
 sin = 10'd120;
 cos = -10'd17;
 end
10'd838:
 begin
 sin = 10'd120;
 cos = -10'd20;
 end
10'd839:
 begin
 sin = 10'd119;
 cos = -10'd23;
 end
10'd840:
 begin
 sin = 10'd119;
 cos = -10'd26;
 end
10'd841:
 begin
 sin = 10'd118;
 cos = -10'd29;
 end
10'd842:
 begin
 sin = 10'd117;
 cos = -10'd32;
 end
10'd843:
 begin
 sin = 10'd116;
 cos = -10'd35;
 end
10'd844:
 begin
 sin = 10'd116;
 cos = -10'd38;
 end
10'd845:
 begin
 sin = 10'd115;
 cos = -10'd40;
 end
10'd846:
 begin
 sin = 10'd114;
 cos = -10'd43;
 end
10'd847:
 begin
 sin = 10'd112;
 cos = -10'd46;
 end
10'd848:
 begin
 sin = 10'd111;
 cos = -10'd49;
 end
10'd849:
 begin
 sin = 10'd110;
 cos = -10'd51;
 end
10'd850:
 begin
 sin = 10'd109;
 cos = -10'd54;
 end
10'd851:
 begin
 sin = 10'd107;
 cos = -10'd57;
 end
10'd852:
 begin
 sin = 10'd106;
 cos = -10'd59;
 end
10'd853:
 begin
 sin = 10'd104;
 cos = -10'd62;
 end
10'd854:
 begin
 sin = 10'd103;
 cos = -10'd65;
 end
10'd855:
 begin
 sin = 10'd101;
 cos = -10'd67;
 end
10'd856:
 begin
 sin = 10'd100;
 cos = -10'd70;
 end
10'd857:
 begin
 sin = 10'd98;
 cos = -10'd72;
 end
10'd858:
 begin
 sin = 10'd96;
 cos = -10'd74;
 end
10'd859:
 begin
 sin = 10'd94;
 cos = -10'd77;
 end
10'd860:
 begin
 sin = 10'd92;
 cos = -10'd79;
 end
10'd861:
 begin
 sin = 10'd90;
 cos = -10'd81;
 end
10'd862:
 begin
 sin = 10'd88;
 cos = -10'd83;
 end
10'd863:
 begin
 sin = 10'd86;
 cos = -10'd86;
 end
10'd864:
 begin
 sin = 10'd84;
 cos = -10'd88;
 end
10'd865:
 begin
 sin = 10'd82;
 cos = -10'd90;
 end
10'd866:
 begin
 sin = 10'd80;
 cos = -10'd92;
 end
10'd867:
 begin
 sin = 10'd77;
 cos = -10'd94;
 end
10'd868:
 begin
 sin = 10'd75;
 cos = -10'd96;
 end
10'd869:
 begin
 sin = 10'd73;
 cos = -10'd97;
 end
10'd870:
 begin
 sin = 10'd70;
 cos = -10'd99;
 end
10'd871:
 begin
 sin = 10'd68;
 cos = -10'd101;
 end
10'd872:
 begin
 sin = 10'd65;
 cos = -10'd102;
 end
10'd873:
 begin
 sin = 10'd63;
 cos = -10'd104;
 end
10'd874:
 begin
 sin = 10'd60;
 cos = -10'd106;
 end
10'd875:
 begin
 sin = 10'd58;
 cos = -10'd107;
 end
10'd876:
 begin
 sin = 10'd55;
 cos = -10'd108;
 end
10'd877:
 begin
 sin = 10'd52;
 cos = -10'd110;
 end
10'd878:
 begin
 sin = 10'd50;
 cos = -10'd111;
 end
10'd879:
 begin
 sin = 10'd47;
 cos = -10'd112;
 end
10'd880:
 begin
 sin = 10'd44;
 cos = -10'd113;
 end
10'd881:
 begin
 sin = 10'd41;
 cos = -10'd114;
 end
10'd882:
 begin
 sin = 10'd39;
 cos = -10'd115;
 end
10'd883:
 begin
 sin = 10'd36;
 cos = -10'd116;
 end
10'd884:
 begin
 sin = 10'd33;
 cos = -10'd117;
 end
10'd885:
 begin
 sin = 10'd30;
 cos = -10'd118;
 end
10'd886:
 begin
 sin = 10'd27;
 cos = -10'd118;
 end
10'd887:
 begin
 sin = 10'd24;
 cos = -10'd119;
 end
10'd888:
 begin
 sin = 10'd21;
 cos = -10'd120;
 end
10'd889:
 begin
 sin = 10'd18;
 cos = -10'd120;
 end
10'd890:
 begin
 sin = 10'd15;
 cos = -10'd121;
 end
10'd891:
 begin
 sin = 10'd12;
 cos = -10'd121;
 end
10'd892:
 begin
 sin = 10'd9;
 cos = -10'd121;
 end
10'd893:
 begin
 sin = 10'd6;
 cos = -10'd121;
 end
10'd894:
 begin
 sin = 10'd3;
 cos = -10'd121;
 end
10'd895:
 begin
 sin = 10'd0;
 cos = -10'd121;
 end
10'd896:
 begin
 sin = -10'd3;
 cos = -10'd121;
 end
10'd897:
 begin
 sin = -10'd6;
 cos = -10'd121;
 end
10'd898:
 begin
 sin = -10'd9;
 cos = -10'd121;
 end
10'd899:
 begin
 sin = -10'd12;
 cos = -10'd121;
 end
10'd900:
 begin
 sin = -10'd15;
 cos = -10'd121;
 end
10'd901:
 begin
 sin = -10'd17;
 cos = -10'd120;
 end
10'd902:
 begin
 sin = -10'd20;
 cos = -10'd120;
 end
10'd903:
 begin
 sin = -10'd23;
 cos = -10'd119;
 end
10'd904:
 begin
 sin = -10'd26;
 cos = -10'd119;
 end
10'd905:
 begin
 sin = -10'd29;
 cos = -10'd118;
 end
10'd906:
 begin
 sin = -10'd32;
 cos = -10'd117;
 end
10'd907:
 begin
 sin = -10'd35;
 cos = -10'd116;
 end
10'd908:
 begin
 sin = -10'd38;
 cos = -10'd115;
 end
10'd909:
 begin
 sin = -10'd41;
 cos = -10'd115;
 end
10'd910:
 begin
 sin = -10'd43;
 cos = -10'd113;
 end
10'd911:
 begin
 sin = -10'd46;
 cos = -10'd112;
 end
10'd912:
 begin
 sin = -10'd49;
 cos = -10'd111;
 end
10'd913:
 begin
 sin = -10'd52;
 cos = -10'd110;
 end
10'd914:
 begin
 sin = -10'd54;
 cos = -10'd109;
 end
10'd915:
 begin
 sin = -10'd57;
 cos = -10'd107;
 end
10'd916:
 begin
 sin = -10'd60;
 cos = -10'd106;
 end
10'd917:
 begin
 sin = -10'd62;
 cos = -10'd104;
 end
10'd918:
 begin
 sin = -10'd65;
 cos = -10'd103;
 end
10'd919:
 begin
 sin = -10'd67;
 cos = -10'd101;
 end
10'd920:
 begin
 sin = -10'd70;
 cos = -10'd100;
 end
10'd921:
 begin
 sin = -10'd72;
 cos = -10'd98;
 end
10'd922:
 begin
 sin = -10'd75;
 cos = -10'd96;
 end
10'd923:
 begin
 sin = -10'd77;
 cos = -10'd94;
 end
10'd924:
 begin
 sin = -10'd79;
 cos = -10'd92;
 end
10'd925:
 begin
 sin = -10'd81;
 cos = -10'd90;
 end
10'd926:
 begin
 sin = -10'd84;
 cos = -10'd88;
 end
10'd927:
 begin
 sin = -10'd86;
 cos = -10'd86;
 end
10'd928:
 begin
 sin = -10'd88;
 cos = -10'd84;
 end
10'd929:
 begin
 sin = -10'd90;
 cos = -10'd82;
 end
10'd930:
 begin
 sin = -10'd92;
 cos = -10'd80;
 end
10'd931:
 begin
 sin = -10'd94;
 cos = -10'd77;
 end
10'd932:
 begin
 sin = -10'd96;
 cos = -10'd75;
 end
10'd933:
 begin
 sin = -10'd97;
 cos = -10'd73;
 end
10'd934:
 begin
 sin = -10'd99;
 cos = -10'd70;
 end
10'd935:
 begin
 sin = -10'd101;
 cos = -10'd68;
 end
10'd936:
 begin
 sin = -10'd103;
 cos = -10'd65;
 end
10'd937:
 begin
 sin = -10'd104;
 cos = -10'd63;
 end
10'd938:
 begin
 sin = -10'd106;
 cos = -10'd60;
 end
10'd939:
 begin
 sin = -10'd107;
 cos = -10'd57;
 end
10'd940:
 begin
 sin = -10'd108;
 cos = -10'd55;
 end
10'd941:
 begin
 sin = -10'd110;
 cos = -10'd52;
 end
10'd942:
 begin
 sin = -10'd111;
 cos = -10'd49;
 end
10'd943:
 begin
 sin = -10'd112;
 cos = -10'd47;
 end
10'd944:
 begin
 sin = -10'd113;
 cos = -10'd44;
 end
10'd945:
 begin
 sin = -10'd114;
 cos = -10'd41;
 end
10'd946:
 begin
 sin = -10'd115;
 cos = -10'd38;
 end
10'd947:
 begin
 sin = -10'd116;
 cos = -10'd35;
 end
10'd948:
 begin
 sin = -10'd117;
 cos = -10'd33;
 end
10'd949:
 begin
 sin = -10'd118;
 cos = -10'd30;
 end
10'd950:
 begin
 sin = -10'd119;
 cos = -10'd27;
 end
10'd951:
 begin
 sin = -10'd119;
 cos = -10'd24;
 end
10'd952:
 begin
 sin = -10'd120;
 cos = -10'd21;
 end
10'd953:
 begin
 sin = -10'd120;
 cos = -10'd18;
 end
10'd954:
 begin
 sin = -10'd121;
 cos = -10'd15;
 end
10'd955:
 begin
 sin = -10'd121;
 cos = -10'd12;
 end
10'd956:
 begin
 sin = -10'd121;
 cos = -10'd9;
 end
10'd957:
 begin
 sin = -10'd121;
 cos = -10'd6;
 end
10'd958:
 begin
 sin = -10'd121;
 cos = -10'd3;
 end
10'd959:
 begin
 sin = -10'd121;
 cos = -10'd0;
 end
10'd960:
 begin
 sin = -10'd121;
 cos = 10'd3;
 end
10'd961:
 begin
 sin = -10'd121;
 cos = 10'd6;
 end
10'd962:
 begin
 sin = -10'd121;
 cos = 10'd9;
 end
10'd963:
 begin
 sin = -10'd121;
 cos = 10'd12;
 end
10'd964:
 begin
 sin = -10'd121;
 cos = 10'd15;
 end
10'd965:
 begin
 sin = -10'd120;
 cos = 10'd18;
 end
10'd966:
 begin
 sin = -10'd120;
 cos = 10'd21;
 end
10'd967:
 begin
 sin = -10'd119;
 cos = 10'd24;
 end
10'd968:
 begin
 sin = -10'd119;
 cos = 10'd26;
 end
10'd969:
 begin
 sin = -10'd118;
 cos = 10'd29;
 end
10'd970:
 begin
 sin = -10'd117;
 cos = 10'd32;
 end
10'd971:
 begin
 sin = -10'd116;
 cos = 10'd35;
 end
10'd972:
 begin
 sin = -10'd115;
 cos = 10'd38;
 end
10'd973:
 begin
 sin = -10'd114;
 cos = 10'd41;
 end
10'd974:
 begin
 sin = -10'd113;
 cos = 10'd44;
 end
10'd975:
 begin
 sin = -10'd112;
 cos = 10'd46;
 end
10'd976:
 begin
 sin = -10'd111;
 cos = 10'd49;
 end
10'd977:
 begin
 sin = -10'd110;
 cos = 10'd52;
 end
10'd978:
 begin
 sin = -10'd109;
 cos = 10'd55;
 end
10'd979:
 begin
 sin = -10'd107;
 cos = 10'd57;
 end
10'd980:
 begin
 sin = -10'd106;
 cos = 10'd60;
 end
10'd981:
 begin
 sin = -10'd104;
 cos = 10'd62;
 end
10'd982:
 begin
 sin = -10'd103;
 cos = 10'd65;
 end
10'd983:
 begin
 sin = -10'd101;
 cos = 10'd67;
 end
10'd984:
 begin
 sin = -10'd99;
 cos = 10'd70;
 end
10'd985:
 begin
 sin = -10'd98;
 cos = 10'd72;
 end
10'd986:
 begin
 sin = -10'd96;
 cos = 10'd75;
 end
10'd987:
 begin
 sin = -10'd94;
 cos = 10'd77;
 end
10'd988:
 begin
 sin = -10'd92;
 cos = 10'd79;
 end
10'd989:
 begin
 sin = -10'd90;
 cos = 10'd82;
 end
10'd990:
 begin
 sin = -10'd88;
 cos = 10'd84;
 end
10'd991:
 begin
 sin = -10'd86;
 cos = 10'd86;
 end
10'd992:
 begin
 sin = -10'd84;
 cos = 10'd88;
 end
10'd993:
 begin
 sin = -10'd82;
 cos = 10'd90;
 end
10'd994:
 begin
 sin = -10'd79;
 cos = 10'd92;
 end
10'd995:
 begin
 sin = -10'd77;
 cos = 10'd94;
 end
10'd996:
 begin
 sin = -10'd75;
 cos = 10'd96;
 end
10'd997:
 begin
 sin = -10'd72;
 cos = 10'd98;
 end
10'd998:
 begin
 sin = -10'd70;
 cos = 10'd99;
 end
10'd999:
 begin
 sin = -10'd68;
 cos = 10'd101;
 end
10'd1000:
 begin
 sin = -10'd65;
 cos = 10'd103;
 end
10'd1001:
 begin
 sin = -10'd63;
 cos = 10'd104;
 end
10'd1002:
 begin
 sin = -10'd60;
 cos = 10'd106;
 end
10'd1003:
 begin
 sin = -10'd57;
 cos = 10'd107;
 end
10'd1004:
 begin
 sin = -10'd55;
 cos = 10'd109;
 end
10'd1005:
 begin
 sin = -10'd52;
 cos = 10'd110;
 end
10'd1006:
 begin
 sin = -10'd49;
 cos = 10'd111;
 end
10'd1007:
 begin
 sin = -10'd47;
 cos = 10'd112;
 end
10'd1008:
 begin
 sin = -10'd44;
 cos = 10'd113;
 end
10'd1009:
 begin
 sin = -10'd41;
 cos = 10'd114;
 end
10'd1010:
 begin
 sin = -10'd38;
 cos = 10'd115;
 end
10'd1011:
 begin
 sin = -10'd35;
 cos = 10'd116;
 end
10'd1012:
 begin
 sin = -10'd32;
 cos = 10'd117;
 end
10'd1013:
 begin
 sin = -10'd30;
 cos = 10'd118;
 end
10'd1014:
 begin
 sin = -10'd27;
 cos = 10'd119;
 end
10'd1015:
 begin
 sin = -10'd24;
 cos = 10'd119;
 end
10'd1016:
 begin
 sin = -10'd21;
 cos = 10'd120;
 end
10'd1017:
 begin
 sin = -10'd18;
 cos = 10'd120;
 end
10'd1018:
 begin
 sin = -10'd15;
 cos = 10'd121;
 end
10'd1019:
 begin
 sin = -10'd12;
 cos = 10'd121;
 end
10'd1020:
 begin
 sin = -10'd9;
 cos = 10'd121;
 end
10'd1021:
 begin
 sin = -10'd6;
 cos = 10'd121;
 end
10'd1022:
 begin
 sin = -10'd3;
 cos = 10'd121;
 end
10'd1023:
 begin
 sin = 10'd0;
 cos = 10'd122;
 end
endcase
endmodule