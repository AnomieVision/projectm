/**
 * @file playlist_core.h
 * @copyright 2003-2024 projectM Team
 * @brief Core functions to instantiate, destroy and connect a projectM playlist.
 * @since 4.0.0
 *
 * projectM -- Milkdrop-esque visualisation SDK
 * Copyright (C)2003-2024 projectM Team
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 * See 'LICENSE.txt' included within this release
 *
 */

#pragma once

#include "projectM-4/types.h"
#include "projectM-4/playlist_types.h"

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief Creates a playlist manager for the given projectM instance
 *
 * <p>Only one active playlist manager is supported per projectM instance. If multiple playlists use
 * the same projectM instance, only the last created playlist manager will receive preset change
 * callbacks from the projectM instance.</p>
 *
 * <p>To switch to another playlist, use the <tt>projectm_playlist_connect()</tt> method.</p>
 *
 * @important <p>If the projectM handle is not NULL, this method will register the playlist manager with the
 *            <tt>projectm_preset_switch_requested_event</tt> and <tt>projectm_preset_switch_failed_event</tt> callbacks
 *            of the referenced projectM instance. Setting any one of those callbacks to another function pointer
 *            afterwards will cause the playlist manager to no longer being able to switch presets.</p>
 *            <p>If the callback needs to be changed temporarily, the playlist functionality can be restored by calling
 *            <tt>projectm_playlist_connect()</tt>, which will re-register the callbacks.</p>
 *
 * @param projectm_instance The projectM instance to connect to. Can be a null pointer to leave the newly
 *                          created playlist instance unconnected.
 * @return An opaque pointer to the newly created playlist manager instance. Null if creation failed.
 * @since 4.0.0
 */
PROJECTM_PLAYLIST_EXPORT projectm_playlist_handle projectm_playlist_create(projectm_handle projectm_instance);

/**
 * @brief Destroys a previously created playlist manager.
 *
 * If the playlist manager is currently connected to a projectM instance, it will be disconnected
 * by resetting the <tt>projectm_preset_switch_requested_event</tt> and
 * <tt>projectm_preset_switch_failed_event</tt> callbacks to NULL.
 *
 * @param instance The playlist manager instance to destroy.
 * @since 4.0.0
 */
PROJECTM_PLAYLIST_EXPORT void projectm_playlist_destroy(projectm_playlist_handle instance);

/**
 * @brief Connects the playlist manager to a projectM instance.
 *
 * <p>Sets or removes the preset switch callbacks and stores the projectM instance handle for use with
 * manual preset switches via the playlist API.</p>
 *
 * <p>When switching between multiple playlist managers, first call this method on the last used
 * playlist manager with a null pointer for the projectM instance, then call this method with the
 * actual projectM instance on the playlist manager that should be activated. It is also safe to
 * call <tt>projectm_playlist_connect()</tt> with a null projectM handle on all playlist manager instances
 * before activating a single one with a valid, non-null projectM handle.</p>
 *
 * @important <p>If the projectM handle is not NULL, this method will register the playlist manager with the
 *            <tt>projectm_preset_switch_requested_event</tt> and <tt>projectm_preset_switch_failed_event</tt> callbacks
 *            of the referenced projectM instance. Setting any one of those callbacks to another function pointer
 *            afterwards will cause the playlist manager to no longer being able to switch presets.</p>
 *            <p>If the callback needs to be changed temporarily, the playlist functionality can be restored by calling
 *            <tt>projectm_playlist_connect()</tt>, which will re-register the callbacks.</p>
 *
 * @param instance The playlist manager instance.
 * @param projectm_instance The projectM instance to connect to. Can be a null pointer to remove
 *                          an existing binding and clear the projectM preset switch callback.
 * @since 4.0.0
 */
PROJECTM_PLAYLIST_EXPORT void projectm_playlist_connect(projectm_playlist_handle instance, projectm_handle projectm_instance);

#ifdef __cplusplus
} // extern "C"
#endif
