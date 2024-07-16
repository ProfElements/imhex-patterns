struct Position {
    float pos[3];
    u32 index;
};

struct Rotation {
    float rot[4];
};

struct Scale {
    float scale[3];
};

struct Keyframe {
    u32 pos_offset;
    u32 rot_offset;
    u32 scale_offset;
       
    Position pos @ pos_offset;
    float rot[4] @ rot_offset;     
    float scale[3] @ scale_offset;
};

struct Node {
    float origin[4];
    u32 name_offset;
    u16 parent_offset;
    u16 padd;
    u32 keyframe_count;
    u32 keyframe_offset;
     
    if (parent_offset != -1) {
        //Node parent_node @ parent_offset;
    }
     
    char name[] @ name_offset;
    Keyframe keyframes[keyframe_count] @ keyframe_offset;
};

struct ANM {
    char magic[4];
    u32 frame_count;
    u32 node_count;
    u32 node_offset;
    
    Node nodes[node_count] @ node_offset;
};

ANM anim @0x0;
