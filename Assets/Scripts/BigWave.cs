using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BigWave : MonoBehaviour
{
    public float speed;
    // Start is called before the first frame update
    void Start()
    {
        if (speed == 0.00f)
        {
            speed = 0.01f;
        }

    }

    // Update is called once per frame
    void Update()
    {
        Vector3 p = transform.position;
        if (p.z > 20)
        {
            p.z = 0.00f;
        }
        else
        {
            p.z += speed;
            p.y = 1.2f * Mathf.Cos(p.z);
        }

        transform.position = p;
    }
}
