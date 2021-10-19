using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class StartController : MonoBehaviour
{
    public Material mat;

    // Start is called before the first frame update
    void Start()
    {
        mat = Resources.Load("Mat", typeof(Material)) as Material;
        Debug.Log(mat == null);
        Button btn =  transform.GetComponent<Button>();
        btn.onClick.AddListener(ButtonClicked);
    }

    void ButtonClicked()
    {
        // first wave
        for (float i = -50; i < 50; i+=0.5f)
        {
            GameObject sphere = GameObject.CreatePrimitive(PrimitiveType.Sphere);
            sphere.transform.position = new Vector3(i, 0, 0);
            sphere.AddComponent<SphereProps>();
            sphere.AddComponent<BigWave>();
            sphere.GetComponent<MeshRenderer>().material = mat;
        }
        // second wave
        for (float i = -50; i < 50; i+=0.5f)
        {
            GameObject sphere = GameObject.CreatePrimitive(PrimitiveType.Sphere);
            sphere.transform.position = new Vector3(i, 0, 0.5f);
            sphere.AddComponent<SphereProps>();
            sphere.AddComponent<SmallWave>();
            sphere.GetComponent<MeshRenderer>().material = mat;
        }

    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
