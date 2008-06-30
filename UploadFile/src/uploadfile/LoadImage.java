/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package uploadfile;

/*

Java Media APIs: Cross-Platform Imaging, Media and Visualization
Alejandro Terrazas
Sams, Published November 2002, 
ISBN 0672320940
*/



import java.applet.Applet;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.ImageObserver;
import java.net.MalformedURLException;
import java.net.URL;

import javax.swing.JFrame;

/**
 * LoadImage.java -- load and display image specified by imageURL
 */
public class LoadImage extends Applet {
  private Image img;

  private String imageURLString = "peppers.png";

  public void init() {
    URL url;
    try {
      // set imageURL here
      url = new URL(imageURLString);
      img = getImage(url);
    } catch (MalformedURLException me) {
      showStatus("Malformed URL: " + me.getMessage());
    }
  }

  /**
   * overloaded method to prevent clearing drawing area
   */
  public void update(Graphics g) {
    paint(g);
  }

  public void paint(Graphics g) {
    g.drawImage(img, 0, 0, this);
  }

  /**
   * Verbose version of ImageConsumer's imageUpdate method
   */
  public boolean imageUpdate(Image img, int flags, int x, int y, int width,
      int height) {
    System.out.print("Flag(s): ");
    if ((flags & ImageObserver.WIDTH) != 0) {
      System.out.print("WIDTH:(" + width + ") ");
    }

    if ((flags & ImageObserver.HEIGHT) != 0) {
      System.out.print("HEIGHT:(" + height + ") ");
    }

    if ((flags & ImageObserver.PROPERTIES) != 0) {
      System.out.print("PROPERTIES ");
    }

    if ((flags & ImageObserver.SOMEBITS) != 0) {
      System.out.print("SOMEBITS(" + x + "," + y + ")->(");
      System.out.print(width + "," + height + ") ");
      repaint();
    }

    if ((flags & ImageObserver.FRAMEBITS) != 0) {
      System.out.print("FRAMEBITS(" + x + "," + y + ")->(");
      System.out.print(width + "," + height + ") ");
      repaint();
    }

    if ((flags & ImageObserver.ALLBITS) != 0) {
      System.out.print("ALLBITS(" + x + "," + y + ")->(");
      System.out.println(width + "," + height + ") ");
      repaint();
      return false;
    }

    if ((flags & ImageObserver.ABORT) != 0) {
      System.out.println("ABORT \n");
      return false;
    }

    if ((flags & ImageObserver.ERROR) != 0) {
      System.out.println("ERROR ");
      return false;
    }

    System.out.println();
    return true;
  }

  public static void main(String[] argv) {
    JFrame frame = new JFrame();
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    LoadImage a = new LoadImage();

    frame.getContentPane().add(a);
    frame.setSize(300, 300);
    a.init();
    a.start();
    frame.setVisible(true);

  }
}
