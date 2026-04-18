package net.portalmod.core.util;

import net.minecraft.client.renderer.BufferBuilder;
import net.minecraft.client.renderer.Tessellator;
import net.minecraft.client.renderer.vertex.VertexBuffer;
import net.minecraft.client.renderer.vertex.VertexFormat;
import net.portalmod.core.math.Mat4;
import org.lwjgl.opengl.GL11;
import org.lwjgl.opengl.GL20;

import java.util.function.Consumer;

public class VertexRenderer {
    private final VertexFormat format;
    private final int mode;
    private VertexBuffer vb;

    public VertexRenderer(VertexFormat format, int mode) {
        this.format = format;
        this.mode = mode;
    }

    public void reset() {
        if(this.vb != null)
            this.vb.close();
        this.vb = new VertexBuffer(this.format);
    }

    public void data(Consumer<BufferBuilder> data) {
        BufferBuilder bufferbuilder = Tessellator.getInstance().getBuilder();
        bufferbuilder.begin(this.mode, this.format);
        data.accept(bufferbuilder);
        bufferbuilder.end();
        this.vb.upload(bufferbuilder);
    }

    public void render(Mat4 mat) {
        this.vb.bind();
        // Explicit vertex attribute setup for macOS OpenGL core profile compatibility.
        // POSITION_TEX layout: position (vec3, 12 bytes) at offset 0, texcoord (vec2, 8 bytes) at offset 12, stride 20.
        GL20.glEnableVertexAttribArray(0);
        GL20.glVertexAttribPointer(0, 3, GL11.GL_FLOAT, false, 20, 0L);
        GL20.glEnableVertexAttribArray(1);
        GL20.glVertexAttribPointer(1, 2, GL11.GL_FLOAT, false, 20, 12L);
        this.vb.draw(mat.to4f(), this.mode);
        GL20.glDisableVertexAttribArray(0);
        GL20.glDisableVertexAttribArray(1);
        VertexBuffer.unbind();
    }

    public void render() {
        this.render(Mat4.identity());
    }
}