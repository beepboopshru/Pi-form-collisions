import pygame
import sys

# Constants
SCREEN_WIDTH = 1280
SCREEN_HEIGHT = 720
GROUND_HEIGHT = 80
FPS = 60

# Colors
BACKGROUND_COLOR = (40, 48, 51)
GROUND_COLOR = (105, 105, 105)
BLOCK1_COLOR = (245, 245, 245)
BLOCK2_COLOR = (128, 128, 128)
TEXT_COLOR = (230, 230, 230)

# Time step for simulation
DIGITS = 6
TIME_STEPS = 7 ** (DIGITS - 1)

# Block class
class Block:
    def __init__(self, x, w, m, v, screen_height):
        self.x = x * 2
        self.y = screen_height - w - GROUND_HEIGHT
        self.w = w
        self.v = v * 0.150
        self.m = m

    def hit_wall(self):
        return self.x <= 0

    def reverse(self):
        self.v = -self.v

    def collides(self, other):
        return not ((self.x + self.w < other.x) or (self.x > other.x + other.w))

    def bounce(self, other):
        sum_mass = self.m + other.m
        new_v = ((self.m - other.m) / sum_mass) * self.v
        new_v += ((2 * other.m) / sum_mass) * other.v
        return new_v

    def update(self):
        self.x += self.v

    def render(self, screen, color):
        pygame.draw.rect(screen, color, (self.x, self.y, self.w, self.w))


# Main simulation
def main():
    pygame.init()

    # Screen setup
    screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
    pygame.display.set_caption("Block Collision Simulation")
    font_small = pygame.font.Font(None, 30)
    font_large = pygame.font.Font(None, 50)

    # Sound setup
    clack_sound = pygame.mixer.Sound(r"C:\Users\shrey\OneDrive\Documents\Python\Pi from collisions\clack.wav")
    

    # Blocks
    block1 = Block(100, 50, 1, 0, SCREEN_HEIGHT)
    block2 = Block(160, 200, 100 ** (DIGITS - 1), -1 / TIME_STEPS, SCREEN_HEIGHT)

    # Counters
    collision_count = 0
    clock = pygame.time.Clock()

    running = True
    while running:
        # Event handling
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False

        # Update blocks
        clack = False
        for _ in range(TIME_STEPS):
            if block1.collides(block2):
                v1 = block1.bounce(block2)
                v2 = block2.bounce(block1)
                block1.v = v1
                block2.v = v2
                collision_count += 1
                clack = True

            if block1.hit_wall():
                block1.reverse()
                collision_count += 1
                clack = True

            block1.update()
            block2.update()

        if clack:
            clack_sound.play()

        # Drawing
        screen.fill(BACKGROUND_COLOR)

        # Ground
        pygame.draw.rect(screen, GROUND_COLOR, (0, SCREEN_HEIGHT - GROUND_HEIGHT, SCREEN_WIDTH, GROUND_HEIGHT))

        # Blocks
        block1.render(screen, BLOCK1_COLOR)
        block2.render(screen, BLOCK2_COLOR)

        # Display details
        info_text = [
            f"FPS: {clock.get_fps():.2f}",
            f"V1: {block1.v * TIME_STEPS:.5f}",
            f"V2: {block2.v * TIME_STEPS:.5f}",
            

        ]
        for i, line in enumerate(info_text):
            text_surface = font_small.render(line, True, TEXT_COLOR)
            screen.blit(text_surface, (10, 10 + i * 25))

        # Main text
        main_text = font_large.render(f"π Approximation: {collision_count}", True, TEXT_COLOR)
        screen.blit(main_text, (SCREEN_WIDTH // 2 - main_text.get_width() // 2, 200))

        pygame.display.flip()
        clock.tick(FPS)

    pygame.quit()
    sys.exit()


if __name__ == "__main__":
    main()
