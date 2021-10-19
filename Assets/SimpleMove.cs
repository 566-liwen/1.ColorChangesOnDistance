using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SimpleMove : MonoBehaviour
{
    public float speed;
    // Start is called before the first frame update
    void Start()
    {
        if (speed == 0.00f) {
            speed = 0.01f;
        }
        
    }

    // Update is called once per frame
    void Update()
    {
        Vector3 p = transform.position;
        if (p.x > 20) {
            p.x = 0.00f;
        } else {
            p.x += speed;
            p.y = Mathf.Cos(p.x);
        }
       
        transform.position = p;
    }
}
