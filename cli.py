import click
import docker
import colorama

colorama.init()


@click.command()
@click.argument("image_name")
def download_image(image_name):
    """Downloads a specified Docker image."""

    # Initialize Docker client
    client = docker.from_env()

    click.echo(colorama.Fore.YELLOW +
               f"Downloading image {image_name}..." + colorama.Fore.RESET)

    # Download specified image
    try:
        client.images.pull(image_name)
    except docker.errors.APIError as e:
        click.echo(colorama.Fore.RED +
                   f"Failed to Rownload image {image_name}: {e}" + colorama.Fore.RESET)
        return

    click.echo(colorama.Fore.GREEN +
               f"Successfully downloaded image {image_name}!" + colorama.Fore.RESET)


if __name__ == "__main__":
    download_image()
