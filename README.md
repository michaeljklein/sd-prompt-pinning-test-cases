
# sd-prompt-pinning-test-cases

Test cases for pinning a prompt to a visual target.
See [sd-prompt-pinning](https://github.com/michaeljklein/sd-prompt-pinning)
for the original repository and AUTOMATIC1111 Stable Diffusion Web UI Extension.


## Notes

The GitHub Pages page indexes all of the runs.

Please note that the individual pages may take a long time to load.


## Generating `index.html`

To generate `index.html` and add test runs to this file (`README.md`), run: `./generate_index.rb`


## Test runs (in progress.. 🚧)


First larger batch
- Run: `00000054`
- Prompt: `professional, high quality photorealistic photo RAW of (Atlantis, A lost city of great wisdom and power, now drowned beneath the sea :1.01), rim lighting, breathtaking,massive scale, 8k resolution, detailed, focused, (style of karol bak:0.5)`
- Negative prompt: `grainy, blurry, pixelated, (bad quality, worst quality, low quality, poorly drawn, normal quality:1.3), childish, haze, fish, bird`
- CFG: `11`
- Steps: `20`
- Batch size: `8`
- Size: `256x256`
- From: [https://civitai.com/images/2003249](https://civitai.com/images/2003249)

First target image attempt
- Run: `00000071`
- Prompt: `professional closeup photo of 1 white marble apple on wooden table, detailed, film grain`
- Negative prompt: `worst quality, low quality, text, artist name, painting, artwork, illustration, drawing, 3d, render`
- CFG: `8`
- Batch size: `4`
- Generations: `8`
- Size: `256x256`
- Centroid radius: `0.75`
- Initial population std: `0.5`
- User target image scaled to: `256x256`
- Conversion command: `convert ~/Downloads/target_image_marble_apple.png -resize 256x256 target_image_marble_apple_downsized_256x256_civitai.com_images_1952814.png`
- Notes: `incomplete batch`
- From: [https://civitai.com/images/1952814](https://civitai.com/images/1952814)

First attempt from single batch image
- Run: `00000074`
- Prompt: `valley, fairytale treehouse village covered, , matte painting, highly detailed, dynamic lighting, cinematic, realism, realistic, photo real, sunset, detailed, high contrast, denoised, centered, michael whelan`
- Negative prompt: `(worst quality, low quality, normal quality, lowres, low details, oversaturated, undersaturated, overexposed, underexposed, grayscale, bw, bad photo, bad photography, bad art:1.4), (watermark, signature, text font, username, error, logo, words, letters, digits, autograph, trademark, name:1.2), (blur, blurry, grainy), morbid, ugly, asymmetrical, mutated malformed, mutilated, poorly lit, bad shadow, draft, cropped, out of frame, cut off, censored, jpeg artifacts, out of focus, glitch, duplicate, (airbrushed, cartoon, anime, semi-realistic, cgi, render, blender, digital art, manga, amateur:1.3), (3D ,3D Game, 3D Game Scene, 3D Character:1.1), (bad hands, bad anatomy, bad body, bad face, bad teeth, bad arms, bad legs, deformities:1.3)`
- Batch size: `8`
- CFG: `5.5`
- Size: `256x256`
- Initial STD: `0.25`
- Initial centroid radius: `0.33`
- Notes: `target image from first batch`
- From: [https://civitai.com/images/1747029](https://civitai.com/images/1747029)

First multi-objective attempt with single batch image
- Run: `00000091`
- Prompt: `one marble apple fruit, apple made out of marble, centered to the left on a metal steel chef table, rule of thirds, hd, perfect shading, professional photograph`
- Negative prompt: `4K, bad quality, worst quality, computer, iphone, phone, render, rendering, bunch, red apple, yellow apple`
- Batch size: `4`
- CFG: `7.5`
- Size: `416x256`
- Size notes: `("256 * golden_ratio", rounded up to being divisible by "2^5")`
- Initial STD: `0.05`
- Initial centroid radius: `0.1`
- Size-limiter: `1.0`
- Size-limiter weight: `100`
- Target image from first batch: `blue_marble_apple.png`
- From: [https://civitai.com/images/1747029](https://civitai.com/images/1747029)

Loss pinning test
- Run: `00000092`
- Prompt: `one marble apple fruit, centered to the left on a metal steel chef table, rule of thirds, hd, perfect shading, professional photograph`
- Negative prompt: `4K, bad quality, worst quality, computer, iphone, phone, render, rendering, bunch`
- Batch size: `4`
- CFG: `7.5`
- Size: `416x256`
- Size notes: `("256 * golden_ratio", rounded up to being divisible by "2^5")`
- Initial STD: `0.05`
- Initial centroid radius: `0.1`
- Size-limiter: `1.0`
- Size-limiter weight: `100`
- Target image from first batch: `blue_marble_apple.png`
- From: [https://civitai.com/images/1747029](https://civitai.com/images/1747029)

First hyperbatch test
- Run: `00000003`
- Prompt: `test, example, photograph, best`
- Negative prompt: `worst, error, meh`
- Batch size: `8`
- CFG: `7`
- Size: `512x512`
- Steps: `20`
- Initial STD: `0.05`
- Initial centroid radius: `0.15`
- Size-limiter: `0.5`
- Target image from first batch: `hyperbatch_car_example.png`
- Seed: `586335534`
- Sampler: `DPM++ SDE Karras - Hyperbatch`
- Model: `v1-5-pruned-emaonly`
- Timing notes: `Time taken: 30 min. 55.4 sec.`

First no-fork hyperbatch test
- Run: `00000102`
- Prompt: `A person on a snowboard flies high in the air, while someone down below takes a professional picture.`
- Negative prompt: ``
- Batch size: `8`
- CFG: `7`
- Size: `512x512`
- Steps: `20`
- Initial STD: `0.1`
- Initial centroid radius: `0.1`
- Size-limiter: `0.5`
- Target image from first batch: `snowboard_test_image.png`
- Seed: `726671978`
- Sampler: `DPM++ SDE Karras - Hyperbatch`
- Model: `v1-5-pruned-emaonly`
- Timing notes: `Time taken: 40 min. 13.5 sec.`
- Notes: `lambda_ parameter appears to have malfunctioned: generations only have one individual`

Explicit CMA lambda test
- Run: `00000106`
- Prompt: `a vintage red truck parked in a desert landscape. The truck is positioned in the foreground, while a mountain range serves as the backdrop. The sky above the mountains is filled with clouds, creating a picturesque and serene atmosphere. The truck appears to be old and rusted, adding to the sense of age and history in the scene. The combination of the vintage truck, the desert setting, and the majestic mountains creates a visually striking and memorable image.
a breathtaking landscape during sunset. The sky is painted with hues of orange, red, and blue, dotted with fluffy clouds. In the foreground, there's a rustic, vintage red truck, possibly from the mid-20th century, abandoned amidst a field of golden grass. The background features majestic mountains, some of which have snow-capped peaks. The entire scene evokes a sense of nostalgia and serenity.`
- Negative prompt: ``
- Batch size: `8`
- CFG: `7`
- Size: `768x512`
- Steps: `16`
- Initial STD: `0.1`
- Initial centroid radius: `0.1`
- Size-limiter: `0.5`
- CMA lambda_: `2`
- Target image from first batch: `truck_landscape_test.png`
- Seed: `1461702216`
- Sampler: `DPM++ SDE Karras - Hyperbatch`
- Model: `v1-5-pruned-emaonly`
- Notes: `lambda_ parameter appears to have malfunctioned: generations only have one individual
Prompt modified from: https://laion.ai/documents/llava_cogvlm_pop.html`


## References

- [DEAP](http://goo.gl/amJ3x)
  + Félix-Antoine Fortin, François-Michel De Rainville, Marc-André Gardner,
    Marc Parizeau and Christian Gagné, "DEAP: Evolutionary Algorithms Made Easy",
    Journal of Machine Learning Research, vol. 13, pp. 2171-2175, jul 2012.
- [LDR ꟻLIP](https://research.nvidia.com/publication/2020-07_FLIP)

